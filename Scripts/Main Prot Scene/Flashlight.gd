extends SpotLight3D

@onready var head = get_parent().get_node("Head")
@onready var cam = head.get_node("Camera3D")
@onready var main = $"../../.."
@onready var Click = $Click
var TurnedOn
var from
var to
var MousePos: Vector3
var timer


func _process(delta: float) -> void:
	if main.loc == "front" or main.loc == "top":
		if TurnedOn:
			hide()
			Click.play()
			TurnedOn = false
	else:
		if !TurnedOn:
			TurnedOn = true
			await get_tree().create_timer(0.2).timeout
			Click.play()
			show()
		look_at_from_position(from, to)
		

func _input(event: InputEvent) -> void:
	if !main.loc == "front" or !main.loc == "top":
		if event is InputEventMouseMotion:
			from = cam.project_ray_origin(event.position)
			to = from + cam.project_ray_normal(event.position)
