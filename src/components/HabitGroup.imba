import HabitItem from './HabitItem.imba'

export default tag HabitGroup
	prop habits = []
	
	css max-width:80% m:0 auto ofx:scroll
		&.no-ofx ofx:unset
	
	css 
		.group d:flex g:10px g@xs:30px
			&.empty shadow:0 0 0 2px cooler2 rd:md
	
	def render
		const empty? = habits.length === 0
		<self .no-ofx=empty?>
			<div.group .empty=empty?>
				if empty?
					<HabitItem [visibility:hidden]>
				else
					for habit of habits
						<HabitItem name=habit.name done=habit.done id=habit.id/>