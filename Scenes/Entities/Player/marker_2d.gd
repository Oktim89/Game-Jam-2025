extends Marker2D
@export var scenes: Array[PackedScene] =[]
var picked_up_dough = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.connect("update_dough_pos", update_dough_pos)
	Globals.connect("update_cheese_pizza_pos", update_cheese_pizza_pos)
	Globals.connect("remove_item_in_hand", remove_item_in_hand)
	
	pass # Replace with function body.



func _process(delta: float) -> void:
	if Globals.order_success:
		remove_item_in_hand()
		Globals.order_success=false
		
# Called every frame. 'delta' is the elapsed time since the previous frame.

func update_dough_pos():
	if  Globals.item_in_hands==false:
		var temp = scenes[0].instantiate()
		add_child(temp)
		print("in hands")
		picked_up_dough= true
		Globals.item_in_hands= true

	
func remove_item_in_hand()->void:
	remove_child($".".get_child(0))
	Globals.item_in_hands=false
	Globals.final_order=""

func update_cheese_pizza_pos():
	if  Globals.item_in_hands==false:
		var temp = scenes[1].instantiate()
		add_child(temp)
		print("in hands")
		picked_up_dough= true
		Globals.item_in_hands= true
		Globals.final_order="Cheese Pizza"
	
