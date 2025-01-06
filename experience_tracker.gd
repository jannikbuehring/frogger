extends Node2D

var player_experience = 0
var player_level = 1

var experience_threshhold = 20

@warning_ignore("unused_signal")
signal player_level_up

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_enemy_spawner_enemy_killed():
	player_experience += 10
	print(player_experience)
	if (player_experience >= experience_threshhold):
		experience_threshhold += 50
		player_experience = 0
		player_level += 1
		emit_signal("player_level_up")
