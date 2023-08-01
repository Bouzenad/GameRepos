extends SpotLight3D

@onready var head = get_parent().get_node("Head")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse = get_viewport().get_mouse_position()
	look_at(mouse)
