extends Node2D




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("Picked up pizza")
		Globals.emit_signal("update_cheese_pizza_pos")
