extends Node


var for_web = OS.has_feature("web")

# For dev related stuff.
# Also mutes audio by default, thank me later.
var dev_mode = true

var fullscreen = false
var audio_volume = .6


func _ready():
	if Settings.dev_mode:
		Settings.audio_volume = 0
