extends Node

var progress = 0
var fullscreen = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Fullscreen"):
		if fullscreen == false:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			fullscreen = true
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			fullscreen = false
