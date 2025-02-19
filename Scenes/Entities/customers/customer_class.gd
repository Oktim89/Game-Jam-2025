extends CharacterBody2D


@onready var anim =$AnimatedSprite2D
@onready var customer =$"."
var interact_pressed:bool = false
@onready var path_2D = customer.get_parent().get_parent()
@onready var path_follow = customer.get_parent()
@export var move_speed = 60
var last_position :Vector2
var player_in_area:= false
var current_order = {}
var customer_ordered:bool = false
var at_counter_area:bool = false
@onready var foward_detection:=$RayCast2D

@export var possible_pizzas: Array = [
	{"name": "Cheese", "ingredients": ["dough", "sauce", "cheese", "bake"],
	},
	{"name": "Pepperoni", "ingredients": ["dough", "sauce", "cheese", "pepperoni", "bake"]}
	
]
#{"name": "pepperoni", "ingredients": ["dough", "sauce", "cheese", "pepperoni", "bake"]

func _ready() -> void:
	global_position= path_2D.global_position
	last_position=global_position
	#foward_dectection.add_exception_rid(RID(816043786241))
	pick_random_order()
	print(current_order)
	#foward_dectection.exclude_parent=true
	
	
	
	
	
	
func _physics_process(delta: float) -> void:
	counter_area()
	
	#foward_detection.force_raycast_update()  # Ensure it detects every frame
	
	if self.foward_detection.is_colliding() :
		var collider = foward_detection.get_collider()
		if collider.is_in_group("Customers"): 
			move_speed = 0  # Stop if another customer is in front
			
	if !at_counter_area:
		if !(self.foward_detection.is_colliding()) and move_speed==0:
			move_speed=60  # Continue moving if path is clear
		
		
		
		
	path_follow.progress += move_speed * delta
	global_position= path_follow.global_position
	
	
	var movement:= global_position - last_position
	
	if movement.length()>0.1:
		update_animation(movement)
	last_position = global_position
	if movement.length()==0:
		anim.play("idle_right")
	if Input.is_action_just_pressed("interact") and player_in_area and at_counter_area and Globals.final_order==current_order :
		print("Thank you")
		move_speed=60
		customer_ordered= true
		at_counter_area = false
		#print(foward_dectection.get_collider())
	
	#if Input.is_action_just_pressed("ui_accept") and correct_order =="Cheese Pizza":
			#interact_pressed=true
			#move_speed=60

	
	#if !(foward_dectection.is_colliding()) and !customer_in_area:
		#move_speed=60
		
	
	

	
		

	
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

	

	

func counter_area():
	if at_counter_area==true and customer_ordered==false:
		move_speed=0

		
			
		
func pick_random_order():
	current_order = possible_pizzas.pick_random()
	current_order = current_order["name"] +" Pizza"
	


	


func _on_order_detect_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		#var target = foward_dectection.get_collider_rid()
		player_in_area=true
		#foward_dectection.set_collision_mask_value(1 , false)





func _on_order_detect_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_in_area=false


func _on_counter_dectection_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("Counter"):
		at_counter_area=true
		move_speed=0
