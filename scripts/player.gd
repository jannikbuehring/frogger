extends CharacterBody2D

@export var speed = 400
@export var hp = 1

@onready var animated_sprite = $AnimatedSprite2D

@warning_ignore("unused_signal")
signal player_health_depleted

func get_input():
	if Input.is_action_pressed("left"):
		animated_sprite.flip_h = false
		animated_sprite.play("move")
	elif Input.is_action_pressed("right"):
		animated_sprite.flip_h = true
		animated_sprite.play("move")
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()


func _on_hurt_box_hurt(damage):
	hp -= damage
	print(hp)
	if hp <= 0:
		emit_signal("player_health_depleted")


func _on_player_health_depleted():
	$Sprite2D.call_deferred("queue_free")
	$Weapon.get_node("Sprite2D").call_deferred("queue_free")


func _on_experience_tracker_player_level_up():
	$"Level Up Animation/CPUParticles2D".emitting = true
	$"Level Up Animation/Label".show()
	$"Level Up Animation/Level Up Text Timer".start()
	$Weapon.increase_damage(1)
	$Weapon.increase_missle_speed(100)


func _on_level_up_text_timer_timeout():
	$"Level Up Animation/Label".hide()
