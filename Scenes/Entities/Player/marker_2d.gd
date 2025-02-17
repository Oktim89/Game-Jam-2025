extends Marker2D
@export var scenes: Array[PackedScene] =[]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.connect("update_pizza_pos", update_pizza_pos)
	pass # Replace with function body.


func update_pizza_pos():
	var temp = scenes[0].instantiate()
	add_child(temp,true)

# Called every frame. 'delta' is the elapsed time since the previous frame.


		
		
