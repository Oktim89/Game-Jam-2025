extends Area2D

var kind_of_pizza : String # we could use it so depending on the ingredince the pizza might be different as an item

var current_topic : String # the selected ingredient

var mouse_in_pizza: String #if mouse is on pizza

var main_scene ="res://Scenes/main.tscn"
var combo:Array=[]
var stopper = 0
var count = 0
var stop = 0
@onready var pepperoni_file = preload("res://topping/ingredience/pepperoni.tscn")
@onready var cheese_file= preload("res://topping/ingredience/cheese.tscn")
@onready var mushrooms_file = preload("res://topping/ingredience/mushrooms.tscn")
# the scenes for the ingredience


func _physics_process(delta):
	var pepperoni_scene = pepperoni_file.instantiate()
	var olives_scene = cheese_file.instantiate()
	var mushrooms_scene = mushrooms_file.instantiate()
	if Input.is_action_just_pressed("B"):
		get_tree().change_scene_to_file(main_scene)

	if mouse_in_pizza == "in_area": # checking if the conditions are met and spawning images
		if Input.is_action_just_pressed("left_mouse"):
			if current_topic == "pepperoni":
				pepperoni_scene.global_position = get_global_mouse_position()
				add_child(pepperoni_scene)
				if count<1:
					count+=1
					print("pep")
					combo.append("pep")
					count+=1

			elif current_topic == "cheese":
				
				olives_scene.global_position = get_global_mouse_position()
				add_child(olives_scene)
				if stopper<1:
					combo.append("cheese")
					stopper+=1
				

			elif current_topic == "mushrooms":
				mushrooms_scene.global_position = get_global_mouse_position()
				add_child(mushrooms_scene)
				if stop<1:
					combo.append("mushroom")
					stop+=1



func _on_mouse_entered():
	mouse_in_pizza = "in_area"

func _on_mouse_exited():
	mouse_in_pizza = "out_area"


func _on_pepperoni_area_mouse_entered():
	current_topic = "pepperoni"

func _on_olives_area_mouse_entered():
	current_topic = "cheese"
	

func _on_mushrooms_area_mouse_entered():
	current_topic = "mushrooms"
func check_combo()->void:
	if combo.size()==3:
		pass


func _on_button_pressed() -> void:
	check_combo()
