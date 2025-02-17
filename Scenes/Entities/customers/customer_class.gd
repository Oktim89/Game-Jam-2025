extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var anim =$AnimationPlayer
@onready var sprite=$Sprite2D
var current_pos
@onready var path_2D =$Path2D
@onready var path_follow=$Path2D/PathFollow2D
@export var move_speed = 60
var last_position :Vector2

func _ready() -> void:
	position= path_follow.global_position
	last_position=position
	
func _physics_process(delta: float) -> void:
	path_follow.progress += move_speed * delta
	position= path_follow.global_position
	
	var movement:= position - last_position
	if movement.length()>0.1:
		update_animation(movement)
	last_position = position

	
func update_animation(movement: Vector2)->void:
	var anim_name:="walk_"
	anim_name +=(
		"right"
		if abs(movement.x)> abs(movement.y) and movement.x >0
		else "left" if abs(movement.x) > (movement.y) else "down" if movement.y >0 else"up" 
	)
	if anim.current_animation!= anim_name:
		anim.play(anim_name)
		
	

	
