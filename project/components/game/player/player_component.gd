extends PathFollow2D
class_name PlayerComponent


@onready var visual = $Visual
@onready var name_label = $NameLabel
@onready var ball = $Visual/Ball
@onready var button = $Button


var player_resource:PlayerResource :
	set(value):
		player_resource = value
		name_label.text = "[center]" + player_resource.name + "[/center]"
		
		
var team_resource:TeamResource :
	set(value):
		team_resource = value
		visual.color = team_resource.shirt_color
		
		
var has_ball:bool :
	set(value):
		has_ball = value
		ball.visible = value
		
		
func _ready():
	ball.hide()
	
	button.mouse_entered.connect(func ():
		EventBus.show_player_highlight.emit(player_resource)
	)
	button.mouse_exited.connect(func ():
		EventBus.hide_player_highlight.emit(player_resource)
	)
