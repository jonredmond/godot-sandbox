extends Area2D

@export var pickup_color: Color = Color.GREEN

func _ready() -> void:
	$ColorRect.color = pickup_color
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.change_color(pickup_color)
		queue_free()
