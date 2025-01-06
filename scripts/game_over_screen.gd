extends CanvasLayer

func _ready():
	self.hide()

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_quit_pressed():
	get_tree().quit()


func _on_player_player_health_depleted():
	get_tree().paused = true
	self.show()
