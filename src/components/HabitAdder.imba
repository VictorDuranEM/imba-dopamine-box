import {icons} from '../icons.imba'

export default tag HabitAdder
	css 
		$spacing:10px
		bgc:white rd:lg
		d:grid gtc:repeat(auto-fit, minmax(50px, 1fr))
		gap:$spacing p:$spacing
		button bgc:cooler1 aspect-ratio:1 
			rd:10px bd:none d:flex ja:center
		button@focus ol:0
		button@hover bgc:cooler3/50
		button@focus bxs:0 0 0 2px cooler4/25
		
	<self>
		for own name, icon of icons
			<button @click=emit('habitAdded', name)>
				<svg src=icon.svg>