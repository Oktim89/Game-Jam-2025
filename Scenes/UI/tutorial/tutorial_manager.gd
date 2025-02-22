extends Node2D
class_name TutorialManager

@onready var  Quest_box= GlobalQuest.get_node("/root/GlobalQuest")
@onready var  Quest_title =GlobalQuest.get_node("/root/GlobalQuest").get_node("QuestTitle")
@onready var  Quest_desc = GlobalQuest.get_node("/root/GlobalQuest").get_node("QuestDesc")

@export_group("Quest Settings")
@export var quest_name:String
@export var quest_desc:String
@export var reached_goal_text:String

enum QuestStatus{
	available,
	started,
	reached_goal,
	finished,
}

@export var quest_status:QuestStatus = QuestStatus.available
@export_group("Reward Settings")
@export var reward_amount:int
