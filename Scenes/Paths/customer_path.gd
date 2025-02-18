extends Node2D
@export var scenes: Array[PackedScene] =[]

var random = RandomNumberGenerator.new()
var seconds = 0
var count =0
@onready var timer =$Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var temp = scenes[0].instantiate()
	add_child(temp)
	timer.wait_time = random.randi_range(5,10)
