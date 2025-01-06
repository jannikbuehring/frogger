extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func _on_world_paused():
	self.show()
	get_tree().paused = true

func _on_resume_pressed():
	get_tree().paused = false
	self.hide()

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()
