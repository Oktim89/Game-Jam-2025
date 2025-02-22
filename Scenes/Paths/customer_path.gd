extends Node2D
@export var scenes: Array[PackedScene] =[]

var random = RandomNumberGenerator.new()
var seconds = 0
var count =0
@onready var timer =$Timer
var stopper = true

# Called when the node enters the scene tree for the first time.



func _on_timer_timeout() -> void:
	if count>4 :
		stopper=false
	else:
		var temp = scenes[0].instantiate()
		add_child(temp)
		count+=1
		
		
		#stopper = false
	#timer.wait_time = random.randi_range(5,10)
