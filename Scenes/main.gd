extends Node2D

var scene = "res://wave_end_menu/control.tscn"
var count :int = 0
var topping_scene = "res://topping/toppings.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_just_pressed("B"):
		get_tree().change_scene_to_file(topping_scene)
		
	if Globals.time == 0:
		get_tree().change_scene_to_file(scene)


func _on_topping_transition_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
