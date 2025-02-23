extends CharacterBody2D
#reeferences to the animated sprite
@onready var anim =$Sprite

#brings the animation of the sprite into this script
@export var speed : float = 175.0 # sets how fast our character moves
@export var sprint_speed : float = 300.0

const current_speed : float = 175.0
#var is_moving : bool = false
var last_direction:Vector2


	
func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("sprint"): #make sprinting mechanic
		speed = sprint_speed
	else:
		speed = current_speed
			
		
	if Input.is_action_pressed("up"): #all of these control the movement 
		velocity = Vector2.UP * speed
		anim.play("walking_up")
		last_direction= Vector2.UP
	elif Input.is_action_pressed("down"):
		velocity = Vector2.DOWN * speed
		anim.play("walking_down")
		last_direction= Vector2.DOWN
	elif Input.is_action_pressed("left"):
		anim.play("walking_left")
		velocity = Vector2.LEFT * speed
		last_direction= Vector2.LEFT
	elif Input.is_action_pressed("right"):
		velocity = Vector2.RIGHT * speed
		anim.play("walking_right")
		last_direction= Vector2.RIGHT
	else:
		velocity= Vector2.ZERO
		
	move_and_slide() # ensure it moves actually 
	
func _process(_delta):

		
	if velocity == Vector2.ZERO and last_direction:
		if last_direction== Vector2.UP: #which is down
			anim.play("idle_back")
		elif last_direction==Vector2.DOWN:
			anim.play("idle_forward")
		elif last_direction==Vector2.RIGHT:
			anim.play("idle_right")
		elif last_direction == Vector2.LEFT:
			anim.play("idle_left")

	
