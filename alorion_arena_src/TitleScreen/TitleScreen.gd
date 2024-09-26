extends Control

func _ready() -> void:
	for button in $Menu/CenterRow/ButtonsPlace.get_children():
		button.connect("pressed", self, "_on_Button_pressed",[button.scene_to_load])

func _on_Button_pressed(scene_to_load):
	get_tree().change_scene_to(scene_to_load)
