extends Node2D
@onready var progress_bar =$Oven/VisualCountDown/TextureProgressBar
var time:float=0
var seconds
var minutes
var can_cook:bool = true
@export var time_mult:float= 0.3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar.max_value*=0.1
	progress_bar.visible=false
	print(progress_bar.max_value)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	progress_reset()
		#print("finished")
	
	
	#$Minutes.text = "%02d:" % minutes
	#$Seconds.text = "%02d." % seconds
	
	


func _on_timer_timeout() -> void:
	progress_bar.value+=1
	$Timer.wait_time=1
	$Timer.start()

func progress_reset()->void:
	if progress_bar.value >= progress_bar.max_value and !can_cook:
		progress_bar.value=0
		progress_bar.visible=false
		can_cook=true
		


func _on_oven_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and progress_bar.value==0 and can_cook:
		progress_bar.visible =true
		can_cook=false
		_on_timer_timeout()
