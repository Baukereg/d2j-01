extends VBoxContainer


const AUDIO_CORRECTION = .4
const MUSIC_CORRECTION = .4


@onready var fullscreen_toggle = $FullscreenToggle
@onready var audio_slider = $AudioSlider


func _ready():
	set_audio_volume(Settings.audio_volume)
	
	fullscreen_toggle.pressed.connect(_toggle_fullscreen)
	fullscreen_toggle.button_pressed = Settings.fullscreen
	
	audio_slider.max_value = 1.0
	audio_slider.step = .02
	audio_slider.value = Settings.audio_volume
	
	if Settings.for_web:
		# Itch.io offers its own control for fullscreen.
		fullscreen_toggle.hide()
	
	
func _toggle_fullscreen():
	if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	Settings.fullscreen = DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN
	
	
func set_audio_volume(volume:float):
	Settings.audio_volume = volume
	AudioPlayer.set_volume(linear_to_db(volume * AUDIO_CORRECTION))
	MusicPlayer.set_volume(linear_to_db(volume * MUSIC_CORRECTION))
