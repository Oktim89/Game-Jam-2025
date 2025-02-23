extends Node2D
var scene="res://topping/toppings.tscn"
var in_area
func _process(_delta: float) -> void:
	if in_area and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file(scene)
	

func _on_topping_transition_body_entered(body: Node2D) -> void:
	in_area=true
		
	
