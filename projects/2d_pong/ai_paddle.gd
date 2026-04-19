extends CharacterBody2D


@export var max_speed: float = 350.0
@export var acceleration: float = 2500.0
@export var friction: float = 2500.0
@export var deadzone: float = 8.0

var _ball: Node2D

func _ready() -> void:
	_ball = get_tree().get_first_node_in_group("ball")

func _physics_process(delta: float) -> void:
	var direction: float = 0.0
	if _ball != null:
		var dy: float = _ball.global_position.y - global_position.y
		if absf(dy) > deadzone:
			direction = signf(dy)
	
	if direction != 0.0:
		velocity.y = move_toward(velocity.y, direction * max_speed, acceleration * delta)
	else:
		velocity.y = move_toward(velocity.y, 0.0, friction * delta)
	
	velocity.x = 0.0
	move_and_slide()
