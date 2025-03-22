extends Node


const PLAYER_NAMES = [
	"Ossie", "Kazimierz", "Liam", "Gordon", "Bobby", "Roberto", "George", "Gzregorz", "Marius", "Pat", "Giacanto", "Hans", "Teofilo", "Allan", "Gaetano", "Claudio", "Kenny", "Paul",
	"Ruud", "Oleg", "Daniel", "Sepp", "Dino", "Kevin", "Johan", "Mario", "Carlos", "Gerd", "Franz", "Gianni", "Lev", "Florian", "Denis", "Omar", "Ferenc", "Luigi", "Igor"
]


func generate_player(position:TeamResource.Position, skill_level:int = 0):
	var player:PlayerResource = PlayerResource.new()
	player.name = PLAYER_NAMES.pick_random()
	player.favorite_position = position
	player.current_position = position
	
	match position:
		TeamResource.Position.GOAL:
			player.defense = 3 + randi_range(0, skill_level)
		TeamResource.Position.REAR_GUARD:
			player.defense = 2 + randi_range(0, skill_level)
			player.passing = 2
		TeamResource.Position.MIDFIELD:
			player.dribble = 2
			player.passing = 2 + randi_range(0, skill_level)
			player.shooting = 1
		TeamResource.Position.FRONT:
			player.shooting = 2 + randi_range(0, skill_level)

	return player
