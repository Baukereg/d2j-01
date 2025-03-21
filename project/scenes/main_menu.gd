extends Control


@onready var start_button = $CenterContainer/Menu/StartButton
@onready var quit_button = $CenterContainer/Menu/QuitButton


func _ready():
	start_button.pressed.connect(_start_game)
	start_button.grab_focus()
	quit_button.pressed.connect(_quit)


func _start_game():
	SessionManager.create_new_session(true)
	get_tree().change_scene_to_file("res://scenes/Game.tscn")
	
	
func _quit():
	get_tree().quit()
	
