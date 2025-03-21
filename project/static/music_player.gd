extends Node


enum Track {
	#FOO,
}


@onready var _streams = {
	#Foo: preload("res://...")
}


var _audio_stream:AudioStreamPlayer
var _playlist = [] #[ Track.FOO ]
var _playlist_queue:Array


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	_audio_stream = AudioStreamPlayer.new()
	add_child(_audio_stream)
	_audio_stream.volume_db = 0
	
	# For now, the music player just plays the playlist if present by default.
	if !_playlist.is_empty():
		start_playlist()
	
	
func start(track:Track):
	_audio_stream.finished.disconnect(_playlist_attempt_next)
	_audio_stream.finished.connect(_loop_track)
	_audio_stream.stream = _streams[track]
	_audio_stream.play()
	
	
func start_playlist():
	_audio_stream.finished.disconnect(_loop_track)
	_audio_stream.finished.connect(_playlist_attempt_next)
	_playlist_attempt_next()
	
	
func set_volume(volume:float):
	_audio_stream.volume_db = volume
	
	
func _loop_track():
	_audio_stream.play()
	
	
func _playlist_attempt_next():
	if _playlist_queue.is_empty():
		_playlist_queue = _playlist.duplicate()
		
	var next = _playlist_queue.pop_front()
	_audio_stream.stream = _streams[next]
	_audio_stream.play()
