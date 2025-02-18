extends Node2D
@onready var dough =$Area2D/Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("Picked up dough")
		dough.visible=false
		Globals.emit_signal("update_pizza_pos")
		
		
