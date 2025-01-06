class_name Missle
extends CharacterBody2D

const missle_scene = preload("res://missle.tscn")

var damage: int
var missle_speed: int
var enemy_to_hit: Enemy

static func new_missle(enemy_to_hit: Enemy, damage := 1, missle_speed := 600) -> Missle:
	var new_missle = missle_scene.instantiate()
	new_missle.enemy_to_hit = enemy_to_hit
	new_missle.damage = damage
	new_missle.missle_speed = missle_speed
	return new_missle

# Called when the node enters the scene tree for the first time.
func _ready():
	$HitBox.damage = damage
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = global_position.direction_to(enemy_to_hit.global_position)
	velocity = direction*missle_speed
	move_and_slide()

func _on_hit_box_area_entered(_area):
	call_deferred("queue_free")
