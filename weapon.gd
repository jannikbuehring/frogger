extends Node2D

@export var damage = 1
@export var missle_speed = 600
@export var range = 500
@export var missle_amount = 1

var missle_scene = preload("res://missle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func increase_damage(bonus_damage):
	self.damage += bonus_damage
	
func increase_missle_speed(missle_speed_bonus):
	self.missle_speed += missle_speed_bonus
	
func get_closest_enemy():
	var closest_enemy = null
	var shortest_distance = INF
	for enemy in get_tree().get_nodes_in_group("Enemy"):
		var distance = get_parent().position.distance_to(enemy.position)
		if distance < shortest_distance:
			shortest_distance = distance
			closest_enemy = enemy
	return closest_enemy

func _on_weapon_cooldown_timeout():
	if get_tree().get_node_count_in_group("Enemy") > 0:
		var enemy = get_closest_enemy()
		if get_parent().position.distance_to(enemy.position) < range:
			for i in missle_amount:
				var missle = Missle.new_missle(enemy, damage, missle_speed)
				get_tree().root.add_child(missle)
				missle.position = self.global_position
