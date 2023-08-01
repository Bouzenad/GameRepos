extends SpotLight3D

@onready var head = get_parent().get_node("Head")
@onready var cam = head.get_node("Camera3D")
@onready var main = $"../../.."
var from
var to
var MousePos: Vector3


func _process(delta: float) -> void:
	if !main.loc == "front" and !main.loc == "top":
		show()
		look_at_from_position(from, to)
	else:
		hide()

func _input(event: InputEvent) -> void:
	if !main.loc == "front" or !main.loc == "top":
		if event is InputEventMouseMotion:
			from = cam.project_ray_origin(event.position)
			to = from + cam.project_ray_normal(event.position)
