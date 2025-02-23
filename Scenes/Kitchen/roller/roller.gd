extends Node2D
@onready var progress_bar =$VisualCountDown/TextureProgressBar
var is_finished:bool = true
var count =0
var in_area = false
var timer = 0
@export var time_mult:float= 0.3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	progress_bar.value=1
	progress_bar.max_value*=0.1
	progress_bar.visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_reset()
	
	


func _on_timer_timeout() -> void:
	if timer<8:
		progress_bar.value+=1
		timer+=1
		$Timer.start()
	else:
		
		is_finished = true
		$Timer.stop()
	
	

func progress_reset()->void:
	if progress_bar.value == progress_bar.max_value and is_finished==true:
		#Globals.emit_signal("update_flat_pos")
		progress_bar.value=1
		progress_bar.visible=false

		
func take_out_flat():
	if progress_bar.value==1 and count==1 and Globals.item_in_hands==false and in_area:
		
		Globals.emit_signal("update_flat_pos")
		count=0
		is_finished=true
		


func _on_oven_area_body_entered(body: Node2D) -> void:
	in_area=true
	
	if body.is_in_group("Player")  and progress_bar.value==1 and is_finished and Globals.current_item=="Dough" and count==0:
		progress_bar.visible =true
		is_finished=false
		Globals.emit_signal("remove_item_in_hand")
		Globals.item_in_hands=false
		count=1
		timer=0
		progress_bar.value+=1
		#Globals.is_dough_in_roller = true
		$Timer.start()
	#print(Globals.is_dough_in_roller)
	take_out_flat()
		
		
		
	#if body.is_in_group("Player") and can_quest :
		#Globals.emit_signal("finished_quest_signal")
		#can_quest=false


func _on_oven_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		
		in_area=false
