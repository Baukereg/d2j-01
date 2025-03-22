extends Control


@onready var pitch = $CenterContainer/PitchContrainer/Pitch
@onready var player_highlight_a:PlayerHighlight = $CanvasLayer/PlayerHighlightA
@onready var player_highlight_b:PlayerHighlight = $CanvasLayer/PlayerHighlightB


var player_with_ball:PlayerResource :
	set(value):
		if player_with_ball != null:
			var prev_player_component:PlayerComponent = pitch.player_components_by_resource[value]
			prev_player_component.has_ball = false
			
		player_with_ball = value
		var player_component:PlayerComponent = pitch.player_components_by_resource[value]
		player_component.has_ball = true
		
		
var team_a:TeamResource
var team_b:TeamResource
		


func _ready():
	# Initialize teams.
	team_a = SessionManager.current_session.team
	team_b = SessionManager.current_session.next_opponent
	pitch.set_teams(team_a, team_b)
	player_with_ball = team_a.find_player_by_position(TeamResource.Position.GOAL)[0]
	
	# Initialize player highlights.
	player_highlight_a.team_resource = team_a
	player_highlight_b.team_resource = team_b
	_show_player_highlight(player_with_ball)
	
	EventBus.show_player_highlight.connect(_show_player_highlight)
	EventBus.hide_player_highlight.connect(_hide_player_highlight)


func _show_player_highlight(player_resource:PlayerResource):
	var team_resource:TeamResource = team_a if team_a.players.has(player_resource) else team_b
	var player_highlight:PlayerHighlight = player_highlight_a if team_resource == team_a else player_highlight_b
	
	player_highlight.player_resource = player_resource


func _hide_player_highlight(player_resource:PlayerResource):
	var team_resource:TeamResource = team_a if team_a.players.has(player_resource) else team_b
	var player_highlight:PlayerHighlight = player_highlight_a if team_resource == team_a else player_highlight_b
	
	if player_highlight.player_resource != player_resource:
		return
		
	if team_resource == team_a && team_a.players.has(player_with_ball):
		player_highlight.player_resource = player_with_ball
		return
		
	player_highlight.player_resource = null
	
