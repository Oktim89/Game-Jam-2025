class_name Quest extends TutorialManager


func start_quest()->void:
	if quest_status== QuestStatus.available:
		quest_status = QuestStatus.started
		Quest_box.visible = true
		Quest_title.text =quest_name
		Quest_desc.text = quest_desc
		
func reached_goal()->void:
	#if quest_status== QuestStatus.started:
		quest_status = QuestStatus.reached_goal
		Quest_desc.text = reached_goal_text


func finished_quest()->void:
	#if quest_status== QuestStatus.reached_goal:
		quest_status= QuestStatus.finished
		Quest_box.visible = false
		
