extends Node2D


const PLAYER_COMPONENT = preload("res://components/game/player/player_component.tscn")


@onready var goal_a = $GoalA
@onready var half_a_a = $HalfA_A
@onready var half_a_b = $HalfA_B
@onready var half_b_a = $HalfB_A
@onready var half_b_b = $HalfB_B
@onready var goal_b = $GoalB


var teams:Array[TeamResource]
var player_components_by_resource:Dictionary[PlayerResource, PlayerComponent]


func set_teams(teamA:TeamResource, teamB:TeamResource):
	teams = [teamA, teamB]
	_draw_team(teamA, goal_a, half_a_a, half_b_a, goal_b)
	_draw_team(teamB, goal_b, half_b_b, half_a_b, goal_a)
	_space_pitch()
		
	
func _draw_team(team_resource:TeamResource, goal_self:Path2D, half_self:Path2D, half_opponent:Path2D, goal_component:Path2D):
	# Draw players.
	for player_resource:PlayerResource in team_resource.players:
		var player_component:PlayerComponent = PLAYER_COMPONENT.instantiate()
		player_components_by_resource[player_resource] = player_component
		match player_resource.current_position:
			TeamResource.Position.GOAL: goal_self.add_child(player_component)
			TeamResource.Position.REAR_GUARD: half_self.add_child(player_component)
			TeamResource.Position.MIDFIELD: half_opponent.add_child(player_component)
			TeamResource.Position.FRONT: goal_component.add_child(player_component)
		player_component.player_resource = player_resource
		player_component.team_resource = team_resource


func _space_pitch():
	for path:Path2D in [ goal_a, half_a_a, half_a_b, half_b_a, half_b_b, goal_b ]:
		var num_of_players:int = path.get_child_count()
		var space_per_player:float = 1.0 / num_of_players
		for i in num_of_players:
			var player_component:PlayerComponent = path.get_child(i)
			player_component.progress_ratio = i * space_per_player + (space_per_player * .5)
	
