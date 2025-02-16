extends CharacterBody2D
#reeferences to the animated sprite
@onready var anim =$Sprite
#brings the animation of the sprite into this script
@export var speed : float = 20.0 # sets how fast our character moves

var is_moving : bool = false #tells if the character is moving or not
var dir : String = "none" #string that will help us with animation

func _process(delta):
	
	if Input.is_action_just_pressed("up"): #all of these control the movement 
		velocity = Vector2.UP * speed
		is_moving = true
		dir = "up"
	elif Input.is_action_pressed("down"):
		velocity = Vector2.DOWN * speed
		is_moving = true
		dir = "down"
	elif Input.is_action_pressed("left"):
		velocity = Vector2.LEFT * speed
		is_moving = true
		dir = "left"
	elif Input.is_action_pressed("right"):
		velocity = Vector2.RIGHT * speed
		is_moving = true
		dir = "right"
		
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
	
	elif is_moving == false: #does idle animation for when the player is not moving
		if dir == "left":
			anim.play("idle_left")
		elif dir == "right":
			anim.play("idle_right")
		elif dir == "up":
			anim.play("idle_back")
		elif dir == "down":
			anim.play("idle_forward")
