extends Node2D

@export var quest:Quest
var can_quest:bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#Globals.connect("reached_quest_signal", reached_quest)
	#Globals.connect("finished_quest_signal", finished_quest)

	
func _process(delta: float) -> void:
	if !can_quest:
		queue_free()
		
func _on_door_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if quest.quest_status == quest.QuestStatus.available:
			quest.start_quest()
			
		
func reached_quest()->void:
	quest.quest_status =quest.QuestStatus.reached_goal
	quest.reached_goal()


func finished_quest()-> void:
	quest.finished_quest()
	can_quest=false
