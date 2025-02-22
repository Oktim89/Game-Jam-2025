extends Panel
@onready var hand =$Sprite2D/TextureRect
var time: float = 0.0
var minutes : float
var seconds : float 
var spring = 200.0
var damp = 10.0
var velocity = 15.0



func _ready() -> void:
	pass
	
func _process(delta) -> void:
	if Globals.time > 0:
		Globals.time-= delta
	else:
		#Globals.Globals.time=0
		Globals.time =0
	
	seconds = fmod(Globals.time, 60)
	minutes = fmod(Globals.time, 3600) / 60
	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d." % seconds
func stop() -> void:
	set_process(false)
	
	
func get_time_formatted() -> String:
	return "%02d:%02d.%03d" % [minutes, seconds]


func _on_timer_timeout() -> void:
	#DampedOscillator.animate(hand,"rotation",spring,damp*2,velocity,2)
	on_press_me_pressed()

func on_press_me_pressed():
	hand.rotation_degrees+=90
	DampedOscillator.animate(hand,"rotation",spring,damp*2,velocity*1.2,2)
	
