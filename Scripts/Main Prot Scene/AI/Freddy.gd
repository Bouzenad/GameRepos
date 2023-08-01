extends Node3D

var stage = null #stage
var AI = null  #difficulty 
var mp = null  #movement opportunity count
var final_stage = 3
var door = null
@onready var BL: Node3D = $"../Model/Left Door"
@onready var BR : Node3D = $"../Model/Right Door"

func _ready():
	BL.hide()
	BR.hide()
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
	door = randf_range(0, 3)
	if door > 1.5:
		door = "right"
	else:
		door = "left"
	if door == "left":
		BL.show()
	else:
		BR.show()
