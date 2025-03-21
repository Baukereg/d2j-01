extends Node


const NUM_OF_CHANNELS = 3


enum Sample {
	#FOO,
}

@onready var fx_data = {
	#Sample.FOO: preload("res://..."),
}


var _channels:Array = []
var _selected:int = 0


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

	for i in NUM_OF_CHANNELS:
		var audio_stream = AudioStreamPlayer.new()
		add_child(audio_stream)
		audio_stream.volume_db = -1
		_channels.push_back(audio_stream)


func set_volume(volume:float):
	for audio_stream in _channels:
		audio_stream.volume_db = volume
	
	
func play(sample:Sample):
	var audio_stream:AudioStreamPlayer = _channels[_selected]
	audio_stream.stop()

	audio_stream.stream = fx_data[sample]
	audio_stream.play()
	
	_selected += 1
	if _selected >= _channels.size():
		_selected = 0
		
