extends Node3D

const SENSITIVITY = 0.005
var location = 1
var moving = false
@onready var head = $Head
@onready var camera = $Head/Camera3D


func _on_detect_left_mouse_entered() -> void:
	#checks if you r looking forward
	if moving == false and head.rotation_degrees.y == 0:
		look_left()

func _on_detect_right_mouse_entered() -> void:
	if moving == false and head.rotation_degrees.y == 0:
		look_right()


func look_left():
	#turns your head to the left door
	moving = true
	while head.rotation_degrees.y < 90:
		head.rotate_y(0.1)
		await get_tree().create_timer(0.01).timeout
	head.rotation_degrees.y = 90
	moving = false


func look_right():
	#turns your head to the right door
	moving = true
	while head.rotation_degrees.y < -90:
		head.rotate_y(-0.1)
		await get_tree().create_timer(0.01).timeout
	head.rotation_degrees.y = -90
	moving = false
