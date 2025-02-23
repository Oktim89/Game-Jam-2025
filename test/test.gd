extends CharacterBody2D

var speed = 300.0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	# Add the gravity.


	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("up"): #all of these control the movement 
		velocity = Vector2.UP * speed
	
	elif Input.is_action_pressed("down"):
		velocity = Vector2.DOWN * speed
		
	elif Input.is_action_pressed("left"):
		velocity = Vector2.LEFT * speed
		
	elif Input.is_action_pressed("right"):
		velocity = Vector2.RIGHT * speed
		
	else:
		velocity= Vector2.ZERO

	move_and_slide()
