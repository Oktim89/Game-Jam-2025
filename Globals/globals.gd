extends Node
signal update_cheese_pizza_pos
signal update_dough_pos
signal update_sauce_pos
signal update_pep_pos
var item_in_hands:bool = false
var used_oven:bool
var toppings: String
signal remove_item_in_hand
var final_order
var order_success:bool
var money:int
signal update_money
var current_item:String
var time = 300.0
var served = 0
var wave = 1

signal update_flat_pos
signal reached_quest_signal
signal finished_quest_signal
signal next_reached_quest_signal
signal next_finished_quest_signal
var in_flat_area:bool
var is_dough_in_roller:bool
