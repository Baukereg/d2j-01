extends Node2D


@onready var score_label = $ScoreLabel
@onready var pause_menu = $CanvasLayer/PauseMenu


func _ready():
	score_label.text = "Score: " + str(SessionManager.current_session.score)
