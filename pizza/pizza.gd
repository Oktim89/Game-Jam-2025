extends Area2D

var in_area = false
var keys = ["B", "C", "U", "F", "G", "H", "I", "J", "L", "Z", "Q", "N"]
var key_nodes = []
var current_key = ""

var keys_clicked : int

var key
var label
var timer
@export var letters_quantity =  10

@export var time = 5

var label_scene =preload("res://pizza/label.tscn")

func _ready():
	randomize()
	timer = $Timer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if keys_clicked == 10:
		win()
	
	
	if Input.is_action_just_pressed("interact") and in_area:
		if key_nodes.is_empty() == true:
			timer.start()
			spawn_key(letters_quantity)
	
	for i in key_nodes:
		if Input.is_action_just_pressed(i.get_node("Label").text):
			i.queue_free()
			keys_clicked += 1
			key_nodes.erase(i)
			break

func _on_body_entered(body):
	if body is CharacterBody2D:
		in_area = true

func _on_body_exited(body):
	if body is CharacterBody2D:
		in_area = false
		key_nodes.clear
		clear_keys()
		timer.stop()
	
func spawn_key(times_looped):
	for i in range(0, times_looped):
		key = label_scene.instantiate()
		label =key.get_node("Label")
		
		if label:
			current_key = keys[randi() % keys.size()]
			label.text = current_key
			var viewport_size = get_viewport().get_visible_rect().size
			var random_x = randf_range(100, viewport_size.x - 100)
			var random_y = randf_range(100, viewport_size.y - 100)
			key.position = Vector2(random_x, random_y)
			add_child(key)
			key_nodes.append(key)


func clear_keys():
	for key in key_nodes:
		key.queue_free()
	key_nodes.clear()


func _on_timer_timeout():
	lost()

func lost():
	clear_keys()
	keys_clicked = 0
	key_nodes.clear()
	print("you lost")

func win():
	keys_clicked = 0
	key_nodes.clear()
	print("you won")
