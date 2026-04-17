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

	# Get the actual viewport size
	var vp_size := get_viewport_rect().size

	pickup.position = Vector2(
		randf_range(margin, vp_size.x - margin),
		randf_range(margin, vp_size.y - margin)
	)

	# Random color
	pickup.pickup_color = Color(randf(), randf(), randf())

	add_child(pickup)
