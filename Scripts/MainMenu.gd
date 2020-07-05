extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_2x2_TimeAttack10_button_down():
	get_tree().change_scene("res://Scenes/2x2 TimeAttack10.tscn")


func _on_3x3_TimeAttack10_button_down():
	get_tree().change_scene("res://Scenes/3x3 TimeAttack10.tscn")


func _on_2x2_TimeAttack50_button_down():
	get_tree().change_scene("res://Scenes/2x2 TimeAttack10.tscn")


func _on_3x3_TimeAttack50_button_down():
	get_tree().change_scene("res://Scenes/3x3 TimeAttack10.tscn")
