extends Node3D

const SENSITIVITY = 0.005
var location = 1
var moving = false
@onready var head = $Head
@onready var camera = $Head/Camera3D
@onready var CamAnim = $Head/HeadMovement


func _on_detect_left_mouse_entered() -> void:
	#checks if you r looking forward
	if moving == false and head.rotation_degrees.y < 90 and round(head.rotation_degrees.y) != 179:
		look_left()

func _on_detect_right_mouse_entered() -> void:
	if moving == false and head.rotation_degrees.y > -90 and round(head.rotation_degrees.y) != 179:
		look_right()
		
func _on_detect_bottom_mouse_entered() -> void:
	if moving == false and head.rotation_degrees.y == 0:
		look_behind()
		
func _on_detect_top_mouse_entered() -> void:
	if moving == false and (head.rotation_degrees.y == 0 or round(head.rotation_degrees.y) == 179):
		look_up()

func look_behind():
	moving = true
	CamAnim.play("TurnBehind")
	await get_tree().create_timer(0.2).timeout
	moving = false
	
func look_up():
	moving = true
	if round(head.rotation_degrees.y) == 179:
		CamAnim.play("TurnBackBehind")
	await  get_tree().create_timer(0.2).timeout
	moving = false


func look_left():
	#turns your head to the left door
	moving = true
	if head.rotation_degrees.y == 0:
		CamAnim.play("TurnLeft")
	else:
		CamAnim.play("TurnBackRight")
	await get_tree().create_timer(0.2).timeout
	moving = false


func look_right():
	#turns your head to the right door
	moving = true
	if head.rotation_degrees.y == 0:
		CamAnim.play("TurnRight")
	else:
		CamAnim.play("TurnBackLeft")
	await get_tree().create_timer(0.2).timeout
	moving = false
