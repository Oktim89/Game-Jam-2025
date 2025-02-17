extends Node2D
@export var scenes: Array[PackedScene] =[]

var random = RandomNumberGenerator.new()
var seconds = 0
var count =0

#@onready var player 
@onready var time = $Timer

func _on_timer_timeout() -> void:
	if count>=1:
		seconds+=1
		
	else:
		var selected_scene_index = 0
		var temp = scenes[selected_scene_index].instantiate()
		add_sibling(temp,true)
		count+=1
		
	
	
	
		
	
