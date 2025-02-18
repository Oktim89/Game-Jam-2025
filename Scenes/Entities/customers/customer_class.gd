extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var anim =$AnimatedSprite2D
@onready var customer =$"."
var correct_order = Globals.final_order
var interact_pressed:bool = false
@onready var path_2D = customer.get_parent().get_parent()
@onready var path_follow = customer.get_parent()
@export var move_speed = 60
var last_position :Vector2

func _ready() -> void:
	global_position= path_2D.global_position
	last_position=global_position
	
	
func _physics_process(delta: float) -> void:#
	path_follow.progress += move_speed * delta
	global_position= path_follow.global_position
	var movement:= global_position - last_position
	if movement.length()>0.1:
		update_animation(movement)
	last_position = global_position
	if movement.length()==0:
		anim.play("idle_right")
	
	#if Input.is_action_just_pressed("ui_accept") and correct_order =="Cheese Pizza":
			#interact_pressed=true
			#move_speed=60
	if correct_order=="Cheese Pizza":
		pass
			
	
	
	

	
func update_animation(movement: Vector2)->void:
	var anim_name:="walk_"
	var anim_idle:="idle"
	var count=0
	var last_movement= "idle_down"
	anim_name +=(
		"right"
		if abs(movement.x)> abs(movement.y) and movement.x >0
		else "left" if abs(movement.x) > (movement.y) else "up" if movement.y <0 else "down" 
	)

	if abs(movement.x)==0 and abs(movement.y) > abs(movement.x):
		anim_name="walk_up"
		
	if abs(movement.x)<0.06:
		anim_name="walk_up"
	
	if anim.animation!= anim_name:
		anim.play(anim_name)

	

	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Counter"):
		move_speed=0
		
		
			
		
		
