extends Resource
class_name PlayerData


var player_pos :Vector2
var player_money:int
#I want so save position
#amount of coins 
#the wave number
#upgrades
func update_pos(value: Vector2)->void:
	player_pos = value
	
func update_money(value:int)->void:
	player_money=value
	
