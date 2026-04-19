extends Node2D

@onready var _ball: Node2D = $Ball

var player_score: int = 0
var ai_score: int = 0

func _ready() -> void:
	$LeftGoal.body_entered.connect(_on_left_goal)
	$RightGoal.body_entered.connect(_on_right_goal)

func _on_left_goal(_body: Node2D) -> void:
	# Ball crossed the LEFT edge -> AI scored on the player
	ai_score += 1
	_reset_round()
	
func _on_right_goal(_body: Node2D) -> void:
	# Ball crossed the RIGHT edge -> player scored on the AI
	player_score += 1
	_reset_round()
	
func _reset_round() -> void:
	print("Player: ", player_score, "  AI: ", ai_score)
	_ball.global_position = Vector2(480, 270)
	_ball.launch()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
