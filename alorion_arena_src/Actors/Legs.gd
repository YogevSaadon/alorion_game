extends Node2D

onready var animation_player = $AnimationPlayer

#in order to call leg animation
var current_position = global_position
var animation_index = -1

func _physics_process(delta: float) -> void:
	if current_position == global_position : 
		if animation_player.current_animation=="walk" :
			animation_player.stop()
			animation_player.play("stop")
			animation_index = animation_index*-1
	else :
		if animation_index == 1:
			animation_player.play("walk")
		else:
				animation_player.play_backwards("walk")
		current_position = global_position
