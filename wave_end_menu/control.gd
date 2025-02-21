extends Control

var label

# Called when the node enters the scene tree for the first time.
func _ready():
	label = $Label



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = "Money made: " + str(Globals.money)
