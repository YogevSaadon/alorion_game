extends Area2D
class_name Hand_right

onready var animation_player = $AnimationPlayer

var _damage = 1
var own = null

var hited_bodies = []
var arr_bodies_count = 0

func _ready() -> void:
	set_physics_process(false)

func _physics_process(delta: float) -> void:
		
	var overlapping_bodies = get_overlapping_bodies()
	for body in overlapping_bodies:
		if not body.is_in_group("Actor"):
			return
		if own.is_in_group("allys"):
			if body.is_in_group("allys"):
				return
		if own.is_in_group("enemys"):
			if  body.is_in_group("enemys"):
				return
		if hited_bodies.has(body):
			return
		hited_bodies.insert(arr_bodies_count,body)
		arr_bodies_count = arr_bodies_count +1
		body.take_damage(_damage)
	

func melee_attack_animation():
	set_physics_process(true)
	animation_player.play("attack")

func set_damage(new_damage):
	_damage = new_damage

func set_own(act):
	own=act

func reset_hited_bodies():
	arr_bodies_count = 0
	hited_bodies.clear()
	set_physics_process(false)
