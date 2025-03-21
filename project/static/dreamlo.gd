extends Node
signal leaderboard_loaded(json:JSON)
signal score_submitted


const DREAMLO_URL = "http://dreamlo.com/..."
const DREAMLO_GET_URL =  "http://dreamlo.com/..."
const DREAMLO_SUBMIT_URL =  "http://dreamlo.com/..."


var http_request:HTTPRequest


func _ready():
	http_request = HTTPRequest.new()
	add_child(http_request)
	
	
func get_leaderboard(num:int = 10):
	http_request.request_completed.connect(_get_leaderboard_completed)
	http_request.request(DREAMLO_GET_URL + str(num))
	
	
func _get_leaderboard_completed(result, response_code, headers, body):
	http_request.request_completed.disconnect(_get_leaderboard_completed)
	
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	leaderboard_loaded.emit(json)


func submit(user_name:String, session:Session):
	http_request.request_completed.connect(_submit_finished)
	var url:String = DREAMLO_SUBMIT_URL + user_name + "/" + str(session.score)
	http_request.request(url)
	
	
func _submit_finished(result, response_code, headers, body):
	http_request.request_completed.disconnect(_submit_finished)
	
