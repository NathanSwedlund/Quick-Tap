extends Label

var shouldCheckTimes = false
# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(getBestTime())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(shouldCheckTimes):
		shouldCheckTimes = false
		checkToUpdateBestTime()
		text = str(getBestTime())

func getBestTime():
	var bestTime
	var filePath = get_parent().get_parent().get("scoreFileLocation")
	var f = File.new()
	if f.file_exists(filePath):
		f.open(filePath, File.READ)
		bestTime = f.get_var()
		f.close()
	else:
		bestTime = 0
		
	return bestTime

func checkToUpdateBestTime():
	var filePath = get_parent().get_parent().get("scoreFileLocation")
	var currentTime = get_parent().get_parent().get_node("Timer").get("elapsedTime")
	if(!getBestTime() or getBestTime() >= currentTime):
		var f = File.new()
		f.open(filePath, File.WRITE)
		f.store_var(currentTime)
		f.close()