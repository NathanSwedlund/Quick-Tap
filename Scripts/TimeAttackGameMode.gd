extends Node2D

export var scoreFileLocation = "user://bestTime50.save"
export var shouldReset = false
export var numOfTargetsToCreate = 50
export var dims = "2x2"

func _ready():
	if(shouldReset):
		var f = File.new()
		f.open(scoreFileLocation, File.WRITE)
		f.store_var(0)
		f.close()
		get_node("Labels/BestTime").text = "N"
		print("getBestTime :: ", getBestTime())
		
func getBestTime():
	var bestTime
	var f = File.new()
	if f.file_exists(scoreFileLocation):
		f.open(scoreFileLocation, File.READ)
		bestTime = f.get_var()
		f.close()
	else:
		bestTime = 0
		
	return bestTime
