extends Node2D
class_name Staff

onready var animation_player = $AnimationPlayer
var FIREBALL_SCENE_PATH = "res://src/weapons/Mage_weapons/Magic/Fireball.tscn"

var _Staff_Damge = 1.1

var _Fireball = null

var own=null

func cast():
	animation_player.play("Cast_Fireball")


func Create_FIREBALL():
	var caster = own
	
	if caster.get_mana() >= 1:#fireball mana cost is 1
		caster.spend_mana(1) 
		_Fireball  = load(FIREBALL_SCENE_PATH).instance()
		_Fireball .rotation_degrees = caster.rotation_degrees
		_Fireball .set_staff_damge_and_owner_group(_Staff_Damge,caster)
		caster.get_parent().add_child(_Fireball)
		_Fireball .position = get_node("ProjectileSpawnPoint").global_position

func set_damage(new_damage):
	_Staff_Damge = new_damage

func set_own(act):
	own=act
