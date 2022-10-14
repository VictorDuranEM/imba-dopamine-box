import {icons} from '../icons.imba'

export default tag HabitItem
	prop name = 'Untitled'
	prop done = false
	prop id = 0
	
	css
		.item tween:all 200ms ease
			rd:md 
			s:70px @xs:90px
			bgc:cooler2
			d:flex ja:center
			&.done bgc:emerald5 c:white
	
	<self>
		<button.item @click=emit('toggleDone', id) .done=done>
			<svg src=icons[name]..svg>