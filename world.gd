extends Node2D

@warning_ignore("unused_signal")
signal paused

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("pause"):
		emit_signal("paused")
	pass
