extends Control

@onready var text=$HBoxContainer/TextureRect/RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_money_text()
	pass
func update_money_text()->void:
	text.text=str(Globals.money)
