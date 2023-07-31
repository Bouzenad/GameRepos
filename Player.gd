extends Node3D

const SENSITIVITY = 0.005
var ldegrees = 0
var rdegrees
var degrees = 0
var moving = false
@onready var head = $Head
@onready var camera = $Head/Camera3D


func _on_detect_left_mouse_entered() -> void:
	degrees = head.rotation_degrees.y + 90
	if moving == false:
		ldegrees = head.rotation_degrees.y
		moving = true
		while head.rotation_degrees.y < degrees:
			head.rotate_y(0.1)
			await get_tree().create_timer(0.01).timeout
		moving = false


func _on_detect_right_mouse_entered() -> void:
	degrees = head.rotation_degrees.y - 90
	rdegrees = head.rotation_degrees.y
	if moving == false and rdegrees > -90:
		moving = true
		while head.rotation_degrees.y > degrees:
			head.rotate_y(-0.1)
			await get_tree().create_timer(0.01).timeout
		moving = false
s
