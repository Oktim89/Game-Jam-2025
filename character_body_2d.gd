extends CharacterBody2D

@export var possible_pizzas: Array = [
	{"name": "cheese", "ingredients": ["dough", "sauce", "cheese", "bake"]},
	{"name": "pepperoni", "ingredients": ["dough", "sauce", "cheese", "pepperoni", "bake"]},
]

var current_order = {}

func _ready():
	pick_random_order()

func pick_random_order():
	current_order = possible_pizzas.pick_random()
	$Label.text = "I want a " + current_order["name"] + " pizza"
