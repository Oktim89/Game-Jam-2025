extends Area2D

var in_area = false
var keys = ["B", "C", "E", "F", "G", "H", "I", "J", "L"]
var key_nodes = []
var current_key = ""

var key_spawn = 0
var cooldown= 1.5

var label_scene =preload("res://pizza/label.tscn")

func _ready():
	randomize()
	#var spawn_timer = $Timer
	#spawn_timer.wait_time = key_spawn

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("interact") and in_area:
		spawn_key()
		key_spawn += delta
		if key_spawn >= cooldown:
			spawn_key()
			key_spawn = 0
	
	if current_key != "":
		for label in key_nodes:
			if Input.is_action_just_pressed(current_key):
				label.queue_free()
				key_nodes.erase(label)
				current_key = ""
				break

func _on_body_entered(body):
	in_area = true

func _on_body_exited(body):
	in_area = false
	clear_keys()
	
func spawn_key():
	var key = label_scene.instantiate()
	var label =key.get_node("Label")
	
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
