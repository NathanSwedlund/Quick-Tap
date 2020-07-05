extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_ResetButton_button_down():
	get_parent().get_node("Timer").set("shouldReset", true)
	get_parent().get_node("TargetFactory").set("shouldReset", true)
	get_parent().get_node("PauseButton").set("isPaused", false)
	queue_free()

func _on_ContinueButton_button_down():
	get_parent().get_node("PauseButton").set("isPaused", false)
	if(get_parent().get_node("TargetFactory").get("gameOver") == false):
		get_parent().get_node("Timer").set("shouldIgnoreTimer", false)
	queue_free()


func _on_HomeButton_button_down():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
