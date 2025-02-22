extends Node2D

var scene = "res://wave_end_menu/control.tscn"
var count :int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("A"):
		count+=1
		print(count)
	if Input.is_action_just_pressed("B"):
		get_tree().change_scene_to_file(scene)
		
	if Globals.time == 0:
		get_tree().change_scene_to_file(scene)
