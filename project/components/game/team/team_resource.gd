extends Resource
class_name TeamResource


enum Position {
	BENCH,
	GOAL,
	REAR_GUARD,
	MIDFIELD,
	FRONT
}


@export var name:String
@export var shirt_color:Color
@export var players:Array[PlayerResource]


func find_player_by_position(position:TeamResource.Position):
	return players.filter(func (player_resource:PlayerResource):
		return player_resource.favorite_position == position
	)
