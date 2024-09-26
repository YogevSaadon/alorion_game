extends KinematicBody2D
class_name Actor

onready var UIbar = $Info_bar
onready var Body = $Human_Body

var right_hand_scene_path = "res://src/weapons/melee_weapons/Hands/Hand_right.tscn"
var left_handn_scene_path = "res://src/weapons/melee_weapons/Hands/Hand_left.tscn"
var bow_scene_path = "res://src/weapons/ranged_weapons/Bow.tscn"
var staff_scene_path =  "res://src/weapons/Mage_weapons/Staff.tscn"
var sword_scene_path  = "res://src/weapons/melee_weapons/Melee_right/Sword.tscn"


#in order to put legs and weapons at start
var _right_weapon = null
var _left_weapon = null
var _bow = null
var _staff = null


#movment speed
export var _Base_speed: = 15000.0
var _speed: = Vector2(_Base_speed,_Base_speed)
var _velocity: = Vector2.ZERO


#max hp and mana
var max_health = 15
var current_health = max_health
var max_mana = 15
var current_mana = max_mana

func _ready() -> void:
	add_to_group("Actor")
	_prepare_uibar()
	
	hands_setup(right_hand_scene_path,left_handn_scene_path)
	#right_weapon_setup(right_hand_scene_path)
	#left_weapon_setup(left_handn_scene_path)
	#bow_setup(bow_scene_path)
	#staff_setup(staff_scene_path)
	
	return

func _prepare_uibar():
	UIbar._on_max_health_update(max_health)
	UIbar._on_max_mana_update(max_mana)
	UIbar. _on_health_update(current_health)
	UIbar. _on_mana_update(current_mana)


func take_damage(damage):
	if current_health- damage  <= 0:
		
		#to unset player when he died so no bug will change and improve this later(sould watch agin top town shotter in 7 mins)
		if self.is_in_group("player") :
			yield(get_tree(),"idle_frame")
			get_tree().call_group("enemys","unset_player")
		#
		queue_free()
	current_health = current_health - damage 
	UIbar._on_health_update(current_health)

func set_max_hp(h_p):
	max_health = h_p
	UIbar._on_max_health_update(max_health)

func set_max_mana(m):
	max_mana = m
	UIbar._on_max_mana_update(max_mana)

func gain_hp(h_p):
	current_health += min(h_p,max_health-current_health)
	UIbar. _on_health_update(current_health)

func gain_mana(m):
	current_mana += min(m,max_mana-current_mana)
	UIbar. _on_mana_update(current_mana)

func spend_mana(m):
	current_mana -= m
	UIbar. _on_mana_update(current_mana)

func get_mana():
	return current_mana

func hands_setup(path_right,path_left):
	var right_hand_instance = load(path_right).instance()
	right_hand_instance.set_own(self)
	var right_hand_anchor = $MiddleSpawnPoint/RightWeaponAnchorPoint
	right_hand_anchor.add_child(right_hand_instance)
	_right_weapon = right_hand_instance
	
	var left_hand_instance = load(path_left).instance()
	left_hand_instance.set_own(self)
	var left_hand_anchor = $MiddleSpawnPoint/LeftWeaponAnchorPoint
	left_hand_anchor.add_child(left_hand_instance)
	_left_weapon = left_hand_instance

func right_weapon_setup(path):
	var right_instance = load(path).instance()
	right_instance.set_own(self)
	var right_anchor = $MiddleSpawnPoint/RightWeaponAnchorPoint
	right_anchor.add_child(right_instance)
	_right_weapon = right_instance


func left_weapon_setup(path):
	var left_instance = load(path).instance()
	left_instance.set_own(self)
	var left_anchor = $MiddleSpawnPoint/LeftWeaponAnchorPoint
	left_anchor.add_child(left_instance)
	_left_weapon = left_instance

func bow_setup(path):
	var bow_instance = load(path).instance()
	bow_instance.set_own(self)
	var bow_anchor = $MiddleSpawnPoint
	bow_anchor.add_child(bow_instance)
	_bow = bow_instance

func staff_setup(path):
	var staff_instance = load(path).instance()
	staff_instance.set_own(self)
	var staff_anchor = $MiddleSpawnPoint/RightWeaponAnchorPoint
	staff_anchor.add_child(staff_instance)
	_staff = staff_instance

func attack():
	if _right_weapon != null:
		_right_weapon.melee_attack_animation()
	elif _bow != null:
		if self.is_in_group("player"):
			_bow.draw_for_player()
		else:
			_bow.draw_for_npc()
	elif _staff != null:
		_staff.cast()
	else:
		return

func sword_swap():
	#switch<->case for weapons?
	_right_weapon.queue_free()
	_right_weapon = null
	right_weapon_setup(sword_scene_path)
