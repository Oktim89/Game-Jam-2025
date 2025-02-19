extends Area2D

var kind_of_pizza : String
var current_topic : String

var mouse_in_pizza: String

var mouse_topic : String

var mous_coordinates

@onready var pepperoni_file = preload("res://topping/ingredience/pepperoni.tscn")
@onready var olives_file= preload("res://topping/ingredience/olives.tscn")
@onready var mushrooms_file = preload("res://topping/ingredience/mushrooms.tscn")

func _physics_process(delta):
	var pepperoni_scene = pepperoni_file.instantiate()
	var olives_scene = olives_file.instantiate()
	var mushrooms_scene = mushrooms_file.instantiate()

	if Input.is_action_just_pressed("left_mouse"):
		if mouse_topic == "pepperoni":
			current_topic = "pepperoni"
		if mouse_topic == "olives":
			current_topic = "olives"
		if mouse_topic == "mushrooms":
			current_topic = "mushrooms"

	if mouse_in_pizza == "in_area":
		if Input.is_action_just_pressed("left_mouse"):
			if current_topic == "pepperoni":
				pepperoni_scene.global_position = get_global_mouse_position()
				add_child(pepperoni_scene)
				print("wyghfuw")
			elif current_topic == "olives":
				olives_scene.global_position = get_global_mouse_position()
				add_child(olives_scene)
				print("uiyoh")
			elif current_topic == "mushrooms":
				mushrooms_scene.global_position = get_global_mouse_position()
				add_child(mushrooms_scene)
				print("baiylc")




func _on_mouse_entered():
	mouse_in_pizza = "in_area"

func _on_mouse_exited():
	mouse_in_pizza = "out_area"


func _on_pepperoni_area_mouse_entered():
	mouse_topic = "pepperoni"

func _on_olives_area_mouse_entered():
	mouse_topic = "olives"

func _on_mushrooms_area_mouse_entered():
	mouse_topic = "mushrooms"





func _on_pepperoni_area_mouse_exited():
	mouse_topic = "nothing"


func _on_olives_area_mouse_exited():
	mouse_topic = "nothing"


func _on_mushrooms_area_mouse_exited():
	mouse_topic = "nothing"
