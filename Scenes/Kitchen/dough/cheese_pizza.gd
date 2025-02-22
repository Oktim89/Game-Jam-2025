extends Node2D
var scene = load("res://topping/toppings.tscn")



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Globals.emit_signal("update_cheese_pizza_pos")
