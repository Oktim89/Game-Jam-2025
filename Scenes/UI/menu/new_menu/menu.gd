extends Control

var scene = "res://Scenes/main.tscn"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Camera2D.position =$Camera2D.get_viewport().size/2
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	$AnimationPlayer.play("Zoom")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(scene)
	
