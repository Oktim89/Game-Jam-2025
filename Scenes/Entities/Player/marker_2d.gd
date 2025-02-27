extends Marker2D
@export var scenes: Array[PackedScene] =[]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.connect("update_dough_pos", update_dough_pos)
	Globals.connect("update_cheese_pizza_pos", update_cheese_pizza_pos)
	Globals.connect("remove_item_in_hand", remove_item_in_hand)
	Globals.connect("update_flat_pos", update_flat_pos)
	Globals.connect("update_sauce_pos",update_sauce_pos)
	Globals.connect("update_pep_pos", update_pep_pos)
	



func _process(delta: float) -> void:
	if Globals.order_success:
		Globals.money+=1
		remove_item_in_hand()
		Globals.order_success=false
		#emit_signal("hidden")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.

func update_dough_pos():
	if  Globals.item_in_hands==false:
		var temp = scenes[0].instantiate()
		add_child(temp)
		Globals.item_in_hands= true
		Globals.current_item="Dough"

	
func remove_item_in_hand()->void:
	if $".".get_child(0)!= null:
		remove_child($".".get_child(0))
		Globals.item_in_hands=false
		Globals.final_order=""
		Globals.current_item=""
	else:
		print("no child found")

func update_cheese_pizza_pos():
	if  Globals.current_item =="Sauce Pizza":
		remove_item_in_hand()
		var temp = scenes[1].instantiate()
		add_child(temp)
		Globals.item_in_hands= true
		Globals.final_order="Cheese Pizza"
		Globals.current_item ="Cheese Pizza"
	
func update_flat_pos()->void:
	if  Globals.item_in_hands==false:
		var temp = scenes[2].instantiate()
		add_child(temp)
		Globals.item_in_hands= true
		Globals.current_item ="flat_dough"
		
func update_sauce_pos():
	if   Globals.current_item=="flat_dough":
		remove_item_in_hand()
		var temp = scenes[3].instantiate()
		add_child(temp)
		Globals.item_in_hands= true
		Globals.current_item ="Sauce Pizza"
	
func update_pep_pos():
	if Globals.current_item =="Cheese Pizza":
		remove_item_in_hand()
		var temp = scenes[4].instantiate()
		add_child(temp)
		Globals.item_in_hands= true
		Globals.current_item ="Pep Pizza"
		Globals.final_order="Pep Pizza"
	if  Globals.used_oven==true:
		var temp = scenes[4].instantiate()
		add_child(temp)
		Globals.item_in_hands= true
		Globals.current_item ="Pep Pizza"
		Globals.final_order="Pep Pizza"
		
		
		
	
