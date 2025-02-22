extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Signals.connect("change_skin", change_skin)
	#Globals.transfer_score_to_money()
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		change_scene()
		

func change_scene():
	Globals.save_data()
	get_tree().change_scene_to_file("res://Level Scene/level.tscn")
	
#func change_skin(type):
	#print("type")
	#$Player.icon =Color.WHITE


func _on_skin_1_pressed() -> void:
	print("hello")
	Globals.money-=3
