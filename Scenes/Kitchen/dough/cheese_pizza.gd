extends Node2D
var in_area


func _process(_delta: float) -> void:
	if in_area and Globals.current_item=="Sauce Pizza":
		Globals.emit_signal("update_cheese_pizza_pos")
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("Player"):
		in_area = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		in_area = false
	
