extends Node


var current_session:Session


func create_new_session(set_as_current:bool):
	var session:Session = Session.new()
	
	session.team = TeamResource.new()
	session.team.shirt_color = Color.FLORAL_WHITE
	session.team.players.push_back(PlayerGenerator.generate_player(TeamResource.Position.GOAL, randi_range(0, 5)))
	session.team.players.push_back(PlayerGenerator.generate_player(TeamResource.Position.REAR_GUARD, randi_range(0, 5)))
	session.team.players.push_back(PlayerGenerator.generate_player(TeamResource.Position.REAR_GUARD, randi_range(0, 5)))
	session.team.players.push_back(PlayerGenerator.generate_player(TeamResource.Position.MIDFIELD, randi_range(0, 5)))
	session.team.players.push_back(PlayerGenerator.generate_player(TeamResource.Position.MIDFIELD, randi_range(0, 5)))
	session.team.players.push_back(PlayerGenerator.generate_player(TeamResource.Position.FRONT, randi_range(0, 5)))
	
	session.next_opponent = TeamResource.new()
	session.next_opponent.shirt_color = Color.CRIMSON
	session.next_opponent.players.push_back(PlayerGenerator.generate_player(TeamResource.Position.GOAL, randi_range(0, 5)))
	session.next_opponent.players.push_back(PlayerGenerator.generate_player(TeamResource.Position.REAR_GUARD, randi_range(0, 5)))
	session.next_opponent.players.push_back(PlayerGenerator.generate_player(TeamResource.Position.REAR_GUARD, randi_range(0, 5)))
	session.next_opponent.players.push_back(PlayerGenerator.generate_player(TeamResource.Position.MIDFIELD, randi_range(0, 5)))
	session.next_opponent.players.push_back(PlayerGenerator.generate_player(TeamResource.Position.MIDFIELD, randi_range(0, 5)))
	session.next_opponent.players.push_back(PlayerGenerator.generate_player(TeamResource.Position.FRONT, randi_range(0, 5)))
	
	if set_as_current: current_session = session
	return session
