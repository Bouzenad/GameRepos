extends Node3D

var stage = null #stage
var AI = null  #difficulty 
var mp = null  #movement opportunity count
var final_stage = 3
@onready var Freddy: Node3D = $"../Model/Office"

func _ready():
	Freddy.hide()
	AI = 10
	stage = 0
	movement_opportunity()


func movement_opportunity():
	await get_tree().create_timer(6).timeout
	mp = randi_range(1,20)
	if AI >= mp:
		stage += 1
		print("moved")
	if !stage == final_stage:
		movement_opportunity()
	else:
		print("attack")
		attack_opportunity()


func attack_opportunity():
	Freddy.show()
