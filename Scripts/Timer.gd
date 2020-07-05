extends Node2D

# Declare member variables here. Examples:
var shouldIgnoreTimer = false
export var timerPrecision = 0.03
export var timderDisplayratio = 4

var shouldReset = true
var madeLastUpdate
var elapsedTime = 0
var _timer = null

# Called when the node enters the scene tree for the first time.
func _ready():
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "timerTimeout")
	_timer.set_one_shot(false)
	_timer.set_wait_time(timerPrecision)
	_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(shouldReset):
		shouldReset = false
		shouldIgnoreTimer = false
		elapsedTime = 0
	if(madeLastUpdate == false and shouldIgnoreTimer):
		madeLastUpdate = true	
		var newTime = str(elapsedTime)

func timerTimeout():
	if(shouldIgnoreTimer):
		return
	
	elapsedTime += timerPrecision
	
	var newTime = str(elapsedTime)
	match len(newTime):
		1:
			get_parent().get_node("Labels/ElapsedTime").text = newTime+".00"
		2:
			get_parent().get_node("Labels/ElapsedTime").text = newTime+"00"
		3:
			get_parent().get_node("Labels/ElapsedTime").text = newTime+"0"
		0,4,5,6:
			get_parent().get_node("Labels/ElapsedTime").text = newTime
