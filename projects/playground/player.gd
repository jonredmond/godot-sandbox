extends CharacterBody2D

@export var speed: float = 300.0

func change_color(new_color: Color):
	$Sprite2D.modulate = new_color

func _physics_process(delta: float) -> void:
	# Build a direction vector from input
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")

	# Normalize so diagonals aren't faster
	if direction.length() > 0:
		direction = direction.normalized()

	velocity = direction * speed
	move_and_slide()
