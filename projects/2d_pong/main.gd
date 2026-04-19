extends Node2D

enum State { MENU, PLAYING, GAME_OVER }

const WIN_SCORE: int = 5
const BALL_START_POS: Vector2 = Vector2(480, 270)

@onready var _ball: Node2D = $Ball
@onready var _player_score_label: Label = $HUD/PlayerScore
@onready var _ai_score_label: Label = $HUD/AIScore
@onready var _message_label: Label = $HUD/Message


var player_score: int = 0
var ai_score: int = 0
var _state: State = State.MENU

func _ready() -> void:
	$LeftGoal.body_entered.connect(_on_left_goal)
	$RightGoal.body_entered.connect(_on_right_goal)
	_enter_menu()
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		match _state:
			State.MENU:
				_start_game()
			State.GAME_OVER:
				_enter_menu()

func _enter_menu() -> void:
	_state = State.MENU
	player_score = 0
	ai_score = 0
	_update_scores()
	_ball.stop()
	_ball.global_position = BALL_START_POS
	_message_label.text = "2D PONG\nPress Space to Start"
	_message_label.visible = true
	
func _start_game() -> void:
	_state = State.PLAYING
	_message_label.visible = false
	_ball.global_position = BALL_START_POS
	_ball.launch()

func _enter_game_over(winner: String) -> void:
	_state = State.GAME_OVER
	_ball.stop()
	_message_label.text = "%s WINS!\nPress Space" % winner
	_message_label.visible = true
	
func _on_left_goal(_body: Node2D) -> void:
	# Ball crossed the LEFT edge -> AI scored on the player
	ai_score += 1
	_after_goal()
	
func _on_right_goal(_body: Node2D) -> void:
	# Ball crossed the RIGHT edge -> player scored on the AI
	player_score += 1
	_after_goal()
	
func _after_goal() -> void:
	_update_scores()
	if player_score >= WIN_SCORE:
		_enter_game_over("PLAYER")
	elif ai_score >= WIN_SCORE:
		_enter_game_over("AI")
	else:
		_ball.global_position = Vector2(480, 270)
		_ball.launch()

func _update_scores() -> void:
	_player_score_label.text = str(player_score)
	_ai_score_label.text = str(ai_score)
