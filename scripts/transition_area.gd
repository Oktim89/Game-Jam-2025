extends Area2D

var is_moving : bool = false
var dir : String = "none"

func _process(delta: float) -> void:
	if Input.is_action_pressed("left") or Input.is_action_pressed("ui_left"):
		is_moving = true
		dir = "left"
	elif Input.is_action_pressed("right") or Input.is_action_just_pressed("ui_right"):
		is_moving = true
		dir = "right"
	
func _on_body_entered(body: Node2D) -> void:
	if is_moving == true and dir == "right" and body.position.x > 512:
		move_forward()
	if is_moving == true and dir == "left" and body.position.x < 512:
		move_backward()
		
func _on_body_exited(body: Node2D) -> void:
	if is_moving == true and dir == "left" and body.position.x < 512:
		move_backward()
	if is_moving == true and dir == "right" and body.position.x > 512:
		move_forward()
	
func move_forward():
	get_tree().create_tween().tween_property($"../Customer Camera", "position:x", 512, 0.3)
	
func move_backward():
	get_tree().create_tween().tween_property($"../Customer Camera", "position:x", 0, 0.3)


	
