extends CharacterBody2D
#reeferences to the animated sprite
@onready var anim =$Sprite

#brings the animation of the sprite into this script
@export var speed : float = 175.0 # sets how fast our character moves
@export var sprint_speed : float = 175.0

const current_speed : float = 175.0
var is_moving : bool = false
var dir : String = "none"
var last_direction:Vector2



	
func _process(delta):
	if Input.is_action_pressed("sprint"): #make sprinting mechanic
		speed = sprint_speed
	elif Input.is_action_just_released("sprint"):
		speed = current_speed
			
		
	if Input.is_action_pressed("up"): #all of these control the movement 
		velocity = Vector2.UP * speed
		is_moving = true
		dir = "up"
		last_direction= Vector2.UP
	elif Input.is_action_pressed("down"):
		velocity = Vector2.DOWN * speed
		is_moving = true
		dir = "down"
		last_direction= Vector2.DOWN
	elif Input.is_action_pressed("left"):
		velocity = Vector2.LEFT * speed
		is_moving = true
		dir = "left"
		last_direction= Vector2.LEFT
	elif Input.is_action_pressed("right"):
		velocity = Vector2.RIGHT * speed
		is_moving = true
		dir = "right"
		last_direction= Vector2.RIGHT
	else:
		velocity= Vector2.ZERO
		
	move_and_slide() # ensure it moves actually 
	
	if is_moving == true: #does animation based on which direction the character is facing
		if dir == "left":
			anim.play("walking_left")
		elif dir == "right":
			anim.play("walking_right")
		elif dir == "up":
			anim.play("walking_up")
		elif dir == "down":
			anim.play("walking_down")

	
	
	if velocity == Vector2.ZERO and last_direction:
		if last_direction== Vector2.UP: #which is down
			anim.play("idle_back")
		elif last_direction==Vector2.DOWN:
			anim.play("idle_forward")
		elif last_direction==Vector2.RIGHT:
			anim.play("idle_right")
		elif last_direction == Vector2.LEFT:
			anim.play("idle_left")

	
