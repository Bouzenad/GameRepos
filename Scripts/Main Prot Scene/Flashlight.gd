extends SpotLight3D

@onready var head = get_parent().get_node("Head")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if round(head.rotation_degrees.y) == 179:
		rotation += Vector3(Input.get_last_mouse_velocity().y, Input.get_last_mouse_velocity().x, 0) * -0.0001
