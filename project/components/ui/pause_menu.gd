extends Control
class_name PauseMenu


@onready var continue_button = $ModalContainer/Menu/ContinueButton
@onready var quit_button = $ModalContainer/Menu/QuitButton


@export var disabled:bool = false


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	hide()
	
	continue_button.pressed.connect(_continue)
	quit_button.pressed.connect(_quit)
	
	
func _input(event):
	if Input.is_action_just_pressed("pause_game") && !disabled:
		if !visible:
			get_tree().paused = true
			continue_button.grab_focus()
			show()
		else:
			_continue()
	
	
func _continue():
	get_tree().paused = false
	hide()
	
	
func _quit():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
