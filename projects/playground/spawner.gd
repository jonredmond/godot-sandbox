extends Node2D

@export var pickup_scene: PackedScene
@export var spawn_interval: float = 2.0
@export var margin: float = 50.0

func _ready() -> void:
	var timer := Timer.new()
	timer.wait_time = spawn_interval
	timer.timeout.connect(_spawn_pickup)
	add_child(timer)
	timer.start()

func _spawn_pickup() -> void:
	var pickup := pickup_scene.instantiate()
	var vp_size := get_viewport_rect().size
	var spawn_position := Vector2(
		randf_range(margin, vp_size.x - margin),
		randf_range(margin, vp_size.y - margin)
	)
	pickup.pickup_color = Color(randf(), randf(), randf())
	get_parent().add_child(pickup)
	pickup.global_position = spawn_position
