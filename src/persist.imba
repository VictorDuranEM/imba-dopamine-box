const storageName = 'dopamine-storage';

export def saveHabits habits
	localStorage.setItem(storageName, JSON.stringify(habits))
	
export def loadHabits
	JSON.parse(localStorage.getItem(storageName)) || []
	
export def clearHabits
	localStorage.removeItem(storageName)