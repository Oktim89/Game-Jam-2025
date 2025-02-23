extends Node2D

var scene = "res://wave_end_menu/control.tscn"
var count :int = 0
@onready var player=$Player

var topping_scene = "res://topping/toppings.tscn"
# Called when the node enters the scene tree for the first time.

	
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#saveload.save_game()
	
		
	if Globals.time == 0:
		get_tree().change_scene_to_file(scene)


func _on_topping_transition_body_entered(body: Node2D) -> void:
	print("hello")
	#saveload.save_game()
	#get_tree().change_scene_to_file(topping_scene)

	
