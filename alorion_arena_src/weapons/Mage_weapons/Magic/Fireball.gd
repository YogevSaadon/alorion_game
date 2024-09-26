extends Area2D
class_name Fireball

onready var Fireball_tip = $Fireball_tip

var Fireball_damge = 10
var Fireball_speed = 500

var vec_to_mouse_fireball = Vector2.ZERO

var fireball_is_enemy= true

func _ready() -> void:
	vec_to_mouse_fireball = Fireball_tip.global_position - global_position
	vec_to_mouse_fireball = vec_to_mouse_fireball.normalized()

func _physics_process(delta: float) -> void:
	position += vec_to_mouse_fireball*delta*Fireball_speed
	var overlapping_bodies = get_overlapping_bodies()
	for body in overlapping_bodies:
		if not body.is_in_group("Actor"):
			queue_free()
			return
		if fireball_is_enemy :
			if  body.is_in_group("allys"):
				body.take_damage(Fireball_damge)
				queue_free()
		else :
			if  body.is_in_group("enemys"):
				body.take_damage(Fireball_damge)
				queue_free()

func set_damage(new_damage):
	Fireball_damge = new_damage

func set_staff_damge_and_owner_group(staff_dmg,staff_own):
	if staff_own.is_in_group("allys"):
		fireball_is_enemy = false
		Fireball_damge = Fireball_damge*staff_dmg
