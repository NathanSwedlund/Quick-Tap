extends Node2D

# Declare member variables here. Examples:
var shouldCreatetarget = true
var targetScene

export var xCoords = []
export var yCoords = []
export var coordIndexMod = 2

export var numOfTargetsToCreate = 10
export var currentColor = Color()
var gameOver = false
var shouldReset = true

# Called when the node enters the scene tree for the first time.
func _ready():
	currentColor = Color(randf(), randf(), randf())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(shouldReset):
		if(get_parent().get("dims") == "2x2"):
			coordIndexMod = 2
			targetScene = load("res://Scenes/2x2 Target.tscn")
		if(get_parent().get("dims") == "3x3"):
			coordIndexMod = 3
			targetScene = load("res://Scenes/3x3 Target.tscn")
				
		shouldReset = false
		gameOver = false
		numOfTargetsToCreate = get_parent().get("numOfTargetsToCreate")
		get_parent().get_node("Labels/TargetsRemaining").text = str(numOfTargetsToCreate)
	
	if (shouldCreatetarget and numOfTargetsToCreate > 0):
		get_parent().get_node("Labels/TargetsRemaining").text = str(numOfTargetsToCreate)
		numOfTargetsToCreate -= 1
		shouldCreatetarget = false
		randomize()
		
		var newTarget = targetScene.instance()	
		currentColor = Color(randf(), randf(), randf())
		newTarget.get_node("Control/Button").modulate = currentColor
		updateAllColors(currentColor)
		newTarget.set_position(Vector2(xCoords[randi()%2], yCoords[randi()%2]))
		
		add_child(newTarget)
		
	if(shouldCreatetarget and numOfTargetsToCreate == 0 and gameOver == false):
		gameOver = true
		get_parent().get_node("Labels/TargetsRemaining").text = str(numOfTargetsToCreate)
		get_parent().get_node("Timer").set("shouldIgnoreTimer", true)
		get_parent().get_node("Labels/BestTime").set("shouldCheckTimes", true)
		print("CurrentTime :: ", get_parent().get_node("Timer").get("elapsedTime"))
		updateAllColors(Color(1.0, 1.0, 1.0))
		
func updateAllColors(color):
	get_parent().get_node("TimeBorder").modulate = color
	get_parent().get_node("PauseButton/Pause Button").modulate = color	
	get_parent().get_node("Labels/ElapsedTime").modulate = color
	get_parent().get_node("Labels/BestTimeLabel").modulate = color
	get_parent().get_node("Labels/BestTime").modulate = color
	get_parent().get_node("Labels/TargetsRemainingLabel").modulate = color
	get_parent().get_node("Labels/TargetsRemaining").modulate = color
		