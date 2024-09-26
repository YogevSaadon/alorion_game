extends Actor

var _Mouse_position


func _ready() -> void:
	##for testing hp hits
	set_max_hp(6)
	gain_hp(6)
	
	add_to_group("player")
	add_to_group("allys")
	#tells the ememys im the palyer and helps them to get my location
	yield(get_tree(),"idle_frame")
	get_tree().call_group("enemys","set_player",self)



func _physics_process(delta: float) -> void:
	if  Input.is_action_just_pressed("left_click"):
		attack()
	
	if Input.is_action_just_pressed("e"):
		sword_swap()
	
	movement(delta)
	
	roatate_to_mouse()
	
func movement(del):
	var direction: = get_direction()
	_velocity = direction
	_velocity = move_and_slide(_velocity*del*_speed)

func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right")-Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down")-Input.get_action_strength("move_up")
	).normalized()
 
func roatate_to_mouse():
	_Mouse_position = get_local_mouse_position()
	rotation += _Mouse_position.angle()

