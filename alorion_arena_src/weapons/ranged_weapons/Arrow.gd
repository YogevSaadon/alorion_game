extends Area2D
class_name Arrow


onready var arrow_head = $arrowhead

var _Arrow_damage = 0
#arrow damge toatal = (bow damge + arrow damge )*draw power/100
var _Arrow_Total_Damge = 0
var _Arrow_speed = 0
#arrow speed will be determend by draw power 
var vec_to_mouse_arrow= Vector2.ZERO


var _Slowing_for_arrow = -0.1

var arrow_is_enemy = true

func _ready() -> void:
	vec_to_mouse_arrow = arrow_head.global_position - global_position
	vec_to_mouse_arrow = vec_to_mouse_arrow.normalized()

func _physics_process(delta: float) -> void:

	if _Arrow_speed < 70:
#+shrink arrow a bit before maby
		queue_free()
	 
	position += vec_to_mouse_arrow*delta*_Arrow_speed
	
	var overlapping_bodies = get_overlapping_bodies()
	for body in overlapping_bodies:
		if not body.is_in_group("Actor"):
			queue_free()
			return
		if arrow_is_enemy :
			if  body.is_in_group("allys"):
				body.take_damage(_Arrow_Total_Damge)
				queue_free()
		else :
			if  body.is_in_group("enemys"):
				body.take_damage(_Arrow_Total_Damge)
				queue_free()


#will call this func when craetin  a new arrow type
func set_damage(new_damage):
	_Arrow_damage = new_damage

#bow summon arrow will call this func
func set_Bow_damge_for_arrow_and_draw_power_and_owner_group(BOW_DMG,DRAW_POWER,arr_ow):
	if arr_ow.is_in_group("allys"):
		arrow_is_enemy = false
	_Arrow_Total_Damge = (_Arrow_damage + BOW_DMG)*DRAW_POWER/100
	_Arrow_speed =(DRAW_POWER)*10
	#_Slowing_for_arrow = -100/(DRAW_POWER)^2
