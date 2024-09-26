extends Control

onready var HealthBar = $Healthbar
onready var ManaBar = $Manabar
onready var ProgressTween = $ProgressTween
onready var HealthDelay = $HealthDelay

func _physics_process(delta: float) -> void:
	self.rect_rotation = -get_parent().rotation_degrees

func _on_health_update(hp):
	HealthBar.value= hp
	ProgressTween.interpolate_property(HealthDelay,"value",HealthDelay.value,hp,0.2,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	ProgressTween.start()
	
func _on_max_health_update(maxhp):
	HealthBar.max_value = maxhp
	HealthDelay.max_value = maxhp

func _on_mana_update(mana):
	ManaBar.value = mana

func _on_max_mana_update(maxmana):
	ManaBar.max_value = maxmana

func set_color(color):
	HealthBar.tint_progress = color
