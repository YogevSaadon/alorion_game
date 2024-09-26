extends Actor

var player = null


func _ready() -> void:
	set_max_hp(30)
	gain_hp(30)
	
	add_to_group("enemys")
	UIbar.set_color(Color.darkred)


func _physics_process(delta: float) -> void:
	
	if not player == null:
		roatate_to_player()
	if not player == null:
		attack()
	

func set_player(p):
	player=p
	
func unset_player():
	player= null

func roatate_to_player():
	var vec_to_player = player.global_position -global_position
	vec_to_player = vec_to_player.normalized()
	global_rotation = atan2(vec_to_player.y, vec_to_player.x)


