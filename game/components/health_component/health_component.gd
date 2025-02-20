class_name HealthComponent
extends Node


@export_group("")
@export_range(0, INF) 

var max_value: int = INT64_MAX:
	set(new_value):
		max_value = clamp(new_value, 0, INT64_MAX)
		value = value

var value: int = 0:
	set(new_value):
		value = clamp(new_value, 0, max_value)


var _init_max_health: int = 0
var _health: PosStat = PosStat.new(_init_max_health, _init_max_health) 

var dead: bool = true if health.value == 0 else false


func set_max_health(max_health: int) -> void:
	

func set_health()


func take_damage(damage: Damage) -> int:
	var previous_health: int = health.value
	health.value -= damage.value
	check_death()
	return previous_health - health.value


func take_heal(heal: Heal) -> int:
	var previous_health: int = health.value
	health.value += heal.value
	return health.value - previous_health


func check_death() -> void:
	if health.value == 0:
		dead = true
