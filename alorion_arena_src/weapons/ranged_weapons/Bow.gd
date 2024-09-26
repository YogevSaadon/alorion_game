extends Node2D
class_name Bow

onready var animation_player = $AnimationPlayer
var ARROW_SCENE_PATH = "res://src/weapons/ranged_weapons/Arrow.tscn"

var _Bow_Damge = 100

var own = null
var bow_is_holding = false

var _ARROW = null

func _ready() -> void:
	set_physics_process(false)

func _physics_process(delta: float) -> void:
			if bow_is_holding:
				animation_player.play("bow_hold")
			if not Input.is_action_pressed("left_click"):
				if animation_player.current_animation=="bow_draw":
					if animation_player.current_animation_position < 0.4:
						animation_player.stop()
						animation_player.play("bow_fail")
					else:
						Create_ARROW(ARROW_SCENE_PATH,animation_player.current_animation_position*100)
						animation_player.stop()
						animation_player.play("bow_reset")
				if animation_player.current_animation=="bow_hold":
					Create_ARROW(ARROW_SCENE_PATH,100)
					animation_player.stop()
					animation_player.play("bow_reset")


func set_damage(new_damage):
	_Bow_Damge = new_damage

func Create_ARROW(path,Draw_power):
	_ARROW = load(path).instance()
	_ARROW.rotation_degrees=own.rotation_degrees+180
	_ARROW.set_Bow_damge_for_arrow_and_draw_power_and_owner_group(_Bow_Damge,Draw_power,own)
	own.get_parent().add_child(_ARROW)
	_ARROW.position = get_node("ArrowSpawnPoint").global_position


func set_own(act):
	own=act

func hold_the_bow():
	bow_is_holding = true

func draw_for_player():
	animation_player.play("bow_draw")
	set_physics_process(true)

func draw_for_player_end():
	#will come at the start of fail animation or reset animation
	set_physics_process(false)
	bow_is_holding = false

func draw_for_npc():
	animation_player.play("bow_draw_npc")

func create_arrow_for_npc():
#used in animation for bow_draw_npc
	Create_ARROW(ARROW_SCENE_PATH,100)
