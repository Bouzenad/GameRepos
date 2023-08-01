extends SpotLight3D

@onready var head = get_parent().get_node("Head")
@onready var cam = head.get_node("Camera3D")
var from
var to
var MousePos: Vector3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if round(head.rotation_degrees.y) == 179:
		look_at_from_position(from, to)
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		from = cam.project_ray_origin(event.position)
		to = from + cam.project_ray_normal(event.position)
