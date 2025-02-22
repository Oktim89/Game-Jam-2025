extends Node2D
class_name Dough
@onready var dough =$Area2D/Sprite2D
@export var quest:Quest
var can_quest= true

# Called when the node enters the scene tree for the first time.

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player")  and Globals.item_in_hands==false:
		print("Picked up dough")
		Globals.emit_signal("update_dough_pos")
		
		
	if body.is_in_group("Player") and can_quest:
		Globals.emit_signal("reached_quest_signal")
		can_quest= false
		
		
