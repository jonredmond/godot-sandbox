extends CharacterBody2D


@export var max_speed: float = 500.0
@export var acceleration: float = 4000.0
@export var friction: float = 4000.0

func _physics_process(delta: float) -> void:
		var direction: float = Input.get_axis("player_up", "player_down")
		if direction != 0.0:
			velocity.y = move_toward(velocity.y, direction * max_speed, acceleration * delta)
		else:
			velocity.y = move_toward(velocity.y, 0.0, friction * delta)
		velocity.x = 0.0
		
		move_and_slide()
