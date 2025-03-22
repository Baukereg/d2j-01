extends Control
class_name PlayerHighlight


@onready var visual = $Visual
@onready var visual_mirrored = $VisualMirrored
@onready var info_label = $InfoLabel


var player_resource:PlayerResource :
	set(value):
		player_resource = value
		if player_resource == null:
			hide()
		else:
			_update_info()
			show()
			
			
var team_resource:TeamResource :
	set(value):
		team_resource = value
		visual.color = team_resource.shirt_color
		visual_mirrored.color = team_resource.shirt_color
			
			
@export var mirrored:bool


func _ready():
	visual.visible = !mirrored
	visual_mirrored.visible = mirrored
	hide()
		
		
func _update_info():
	var output:String ="[font_size=36]" + player_resource.name + "[/font_size]\n" + player_resource.position_name
	
	var stats:Array
	if player_resource.defense > 0:
		stats.push_back("[color=" + Color.SKY_BLUE.to_html(false) + "]Defense " + str(player_resource.defense) + "[/color]")
	if player_resource.dribble > 0:
		stats.push_back("[color=" + Color.YELLOW.to_html(false) + "]Dribble " + str(player_resource.dribble) + "[/color]")
	if player_resource.passing > 0:
		stats.push_back("[color=" + Color.LAWN_GREEN.to_html(false) + "]Passing " + str(player_resource.passing) + "[/color]")
	if player_resource.shooting > 0:
		stats.push_back("[color=" + Color.RED.to_html(false) + "]Shooting " + str(player_resource.shooting) + "[/color]")
	output += "\n" + "\n".join(stats)
	
	if mirrored:
		output = "[p align=right]" + output + "[/p]"
	
	info_label.text = output
