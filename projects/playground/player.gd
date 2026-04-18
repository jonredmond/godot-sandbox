extends CharacterBody2D

@export var max_speed: float = 300.0
@export var acceleration: float = 1500.0
@export var friction: float = 1200.0

func change_color(new_color: Color):
	$Sprite2D.modulate = new_color

func _physics_process(delta: float) -> void:
	# Build a direction vector from input
	var direction := Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	)

	# Normalize so diagonals aren't faster
	if direction.length() > 0:
		direction = direction.normalized()
		velocity = velocity.move_toward(direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
	move_and_slide()
