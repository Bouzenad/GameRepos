extends Node

var loc = "front"
@onready var left = $Overlay/Left
@onready var right = $Overlay/Right
@onready var top = $Overlay/Top
@onready var behind = $Overlay/Bottom


func _process(delta: float) -> void:
	#left arrow
	if loc == "front" or loc == "right":
		left.show()
	else:
		left.hide()
	#right arrow
	if loc == "front" or loc == "left":
		right.show()
	else:
		right.hide()
	#top
	if loc == "front" or loc == "top":
		top.show()
	else:
		top.hide()
	#behind
	if loc == "front" or loc == "behind":
		behind.show()
	else:
		behind.hide()
