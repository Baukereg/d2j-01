extends Resource
class_name PlayerResource


@export var name:String
@export var favorite_position:TeamResource.Position

# Statistics.
@export_range(1, 10) var defense:int = 0
@export_range(1, 10) var dribble:int = 0
@export_range(1, 10) var passing:int = 0
@export_range(1, 10) var shooting:int = 0

# Match state.
@export var current_position:TeamResource.Position
@export var cool_down:int = 0
@export var yellow_cards:int = 0
@export var red_cards:int = 0


var position_name:String :
	get:
		match favorite_position:
			TeamResource.Position.GOAL: return "Keeper"
			TeamResource.Position.REAR_GUARD: return "Defender"
			TeamResource.Position.MIDFIELD: return "Midfielder"
			TeamResource.Position.FRONT: return "Striker"
		return ""
