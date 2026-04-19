extends CharacterBody2D


@export var speed: float = 400.0

func _ready() -> void:
	launch()
	
func launch() -> void:
	# Pick a random angle within 45 degrees of horizontal, on either side.
	var angle: float = randf_range(-PI / 4.0, PI / 4.0)
	if randf() < 0.5:
		angle += PI
	
	velocity = Vector2(cos(angle), sin(angle)) * speed

func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
