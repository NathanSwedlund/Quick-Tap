extends Node2D

# Declare member variables here. Examples:

var pauseMenu = preload("res://Scenes/PauseMenu.tscn")
var isPaused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_button_down():
	if(	isPaused ):
		return
		
	isPaused = true
	get_parent().get_node("Timer").set("shouldIgnoreTimer", true)
	var pauseMenuInstance = pauseMenu.instance()
	get_parent().add_child(pauseMenuInstance)
