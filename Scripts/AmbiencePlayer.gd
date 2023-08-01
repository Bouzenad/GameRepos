extends Node3D

@export var Sounds = []
@onready var SoundPlayer = $AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var Ran = randi_range(0, 1500)
	if Ran == 1500:
		SoundPlayer.stream = load(Sounds[randi_range(0, Sounds.size() - 1)])
		SoundPlayer.play()
