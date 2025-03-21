extends Node


var current_session:Session


func create_new_session(set_as_current:bool):
	var session:Session = Session.new()
	if set_as_current:
		current_session = session
	return session
