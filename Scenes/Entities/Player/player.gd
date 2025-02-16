extends CharacterBody2D

@onready var anim =$Sprite


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var last_direction: Vector2

func _physics_process(delta: float) -> void:
	# A

	# Ha

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("ui_left", "ui_right", "ui_down", "ui_up")
	
	
	if direction:
		velocity.x = direction.x * SPEED 
		last_direction = direction
		velocity.y = direction.y *SPEED 
		last_direction = direction
		
	else:
		velocity = Vector2.ZERO
	if velocity == Vector2.ZERO and last_direction:
		if last_direction== Vector2.UP: #which is down
			anim.play("idle forward")
		elif last_direction==Vector2.DOWN:
			anim.play("idle back")
		elif last_direction==Vector2.RIGHT:
			anim.play("idle right")
		elif last_direction == Vector2.LEFT:
			anim.play("idle left")
		

	move_and_slide()
