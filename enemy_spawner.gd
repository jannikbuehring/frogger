extends Node2D

var enemy_scene = preload("res://enemy.tscn")

@warning_ignore("unused_signal")
signal enemy_killed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_spawn_cooldown_timeout():
	var enemy = enemy_scene.instantiate()
	var nums = [-1,1] #list to choose from
	enemy.position = Vector2(get_tree().get_first_node_in_group("Player").global_position.x + (randf_range(500,750)*nums[randi() % nums.size()]), get_tree().get_first_node_in_group("Player").global_position.y + randf_range(300,350)*nums[randi() % nums.size()])
	add_child(enemy)


func _on_child_exiting_tree(_node):
	emit_signal("enemy_killed")
