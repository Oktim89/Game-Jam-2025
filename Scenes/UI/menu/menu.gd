extends Control
var scene = "res://Scenes/main.tscn"
@onready var anim=$AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	anim.play("zoom_in")
	await anim.animation_finished
	get_tree().change_scene_to_file(scene)
