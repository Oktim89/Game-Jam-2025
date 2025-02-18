extends Node2D
class_name Producer
@onready var dough =$Area2D/Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player")  and Globals.item_in_hands==false:
		print("Picked up dough")
		Globals.emit_signal("update_dough_pos")
		
		
