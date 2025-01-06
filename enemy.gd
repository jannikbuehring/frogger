class_name Enemy
extends CharacterBody2D

@export var movement_speed = 80.0
@export var hp = 3

func _physics_process(_delta):
	var player = get_tree().get_first_node_in_group("Player")
	if player != null:
		var direction = global_position.direction_to(player.global_position)
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("default")
		elif direction.x < 0:
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("default")
		velocity = direction*movement_speed
		move_and_slide()


func _on_hurt_box_hurt(damage):
	hp -= damage
	print("Enemy HP: ", hp)
	if hp <= 0:
		call_deferred("queue_free")
