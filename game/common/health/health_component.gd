class_name HealthComponent
extends Node


signal damage_taken(value: int)
signal heal_taken(value: int)
signal health_changed(new_health: int)
signal died


@export_group("")
@export_range(0, 0, 1, "or_greater") var max_health: int = 0:
	set(new_value):
		max_health = maxi(0, new_value)
		health = health

var health: int = max_health:
	set(new_value):
		health = clampi(new_value, 0, max_health)

var dead: bool = false


func _init(new_max_health: int = max_health) -> void:
	max_health = new_max_health


func take_damage(damage: Damage) -> int:
	if dead: return 0

	var previous_health: int = health
	health -= damage.value

	var health_difference = previous_health - health
	if health_difference != 0: health_changed.emit(health)
	damage_taken.emit(health_difference)
	check_death()
	return health_difference


func take_heal(heal: Heal) -> int:
	if dead: return 0

	var previous_health: int = health
	health += heal.value

	var health_difference = health - previous_health
	if health_difference != 0: health_changed.emit(health)
	heal_taken.emit(health_difference)
	return health_difference


func check_death() -> void:
	if dead: return
	if health == 0: 
		dead = true
		died.emit()
