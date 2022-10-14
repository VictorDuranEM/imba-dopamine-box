import './styles/app.css'
import HabitAdder from './components/HabitAdder.imba'
import HabitGroup from './components/HabitGroup.imba'
import {Howl} from 'howler'
import {nanoid} from 'nanoid'
import * as persist from './persist.imba'

global css
	@root
		$panel-space:30px @lt-sm:15px
		$default-speed:350ms
		$default-ease:ease
		$default-tween:all $default-speed $default-ease
	body bgc:#F9FAFC ff:sans-serif
	
tag app
	prop habits = persist.loadHabits() || []
	prop chooserVisible? = false
	prop celebrateSound = new Howl({src:['./celebrate.mp3']})
	
	css h:100vh d:vflex 
	css
		.panel-area d:vflex ja:center flg:1 mb:$panel-space pt:$panel-space
			.controls mt:20px d:flex g:10px
				button bgc:transparent td@hover:underline fs:xs c:cooler4
		.chooser-area pos:relative h:0 tween:$default-tween
			.chooser mx:$panel-space inset:0 ofy:scroll
			&.visible h:100%
			
	def addHabit e
		const newHabit = {id:nanoid(), name:e.detail, done:false}
		habits.push(newHabit)
		persist.saveHabits(habits)
		
	def toggleDone e
		const habit = habits.find(do |h| h.id == e.detail)
		habit.done = !habit.done
		if habits.every(do |h| h.done) then celebrateSound.play()
		persist.saveHabits(habits)
		
	def resetHabits
		habits.forEach do |h| h.done = false
		persist.saveHabits(habits)
		
	def clearHabits
		habits = []
		persist.saveHabits(habits)
			
	def render
		<self>
			<div.panel-area>
				<HabitGroup habits=habits @toggleDone=toggleDone>
				<div.controls>
					<button @click=(do chooserVisible? = !chooserVisible?)> "Toggle"
					<button @click=resetHabits> "Reset All"
					<button @click=clearHabits> "Clear Data"
			<div.chooser-area .visible=chooserVisible?>
				<div.chooser>
					<HabitAdder @habitAdded=addHabit>
		
imba.mount <app>, document.getElementById 'app'