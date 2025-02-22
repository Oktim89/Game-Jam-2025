extends Control

var shop = "res://Scenes/UI/Shop/shop.tscn"
var main = "res://Scenes/main.tscn"
var label
var label2
# Called when the node enters the scene tree for the first time.
func _ready():
	label = $Label
	label2 = $Label2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = "Customers served: " + str(Globals.served)
	label2.text = "Orders fulfilled: " + str(Globals.served)
	
	


func _on_button_pressed():
	Globals.time = 300
	if Globals.wave < 3:
		get_tree().change_scene_to_file(main)
		Globals.wave +=1

func _on_button_2_pressed():
	get_tree().change_scene_to_file(shop)
