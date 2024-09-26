extends Node2D

#func _ready() -> void:
	#OS.window_fullscreen = true
func _physics_process(delta: float) -> void: 
	if Input.is_action_just_pressed("reset_level_for_raviv(o)"):
		get_tree().reload_current_scene()
