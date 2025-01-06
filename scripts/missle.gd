class_name Missle
extends CharacterBody2D

const missle_scene = preload("res://scenes/missle.tscn")

var current_damage: int
var current_missle_speed: int
var current_enemy_to_hit: Enemy

static func new_missle(enemy_to_hit: Enemy, damage := 1, missle_speed := 600) -> Missle:
	var missle = missle_scene.instantiate()
	missle.current_enemy_to_hit = enemy_to_hit
	missle.current_damage = damage
	missle.current_missle_speed = missle_speed
	return missle

# Called when the node enters the scene tree for the first time.
func _ready():
	$HitBox.damage = current_damage
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = global_position.direction_to(current_enemy_to_hit.global_position)
	velocity = direction*current_missle_speed
	move_and_slide()

func _on_hit_box_area_entered(_area):
	call_deferred("queue_free")
