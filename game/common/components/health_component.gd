class_name HealthComponent
extends Node


@warning_ignore("unused_signal") signal died
@warning_ignore("unused_signal") signal health_changed(old_value: float, new_value: float)


@export_group("")
@export_range(0, 0, 1, "or_greater") var max_health: int = 0:
	set(new_value):
		max_health = maxi(0, new_value)
		health = health

var health: int = max_health:
	set(new_value):
		health = clampi(new_value, 0, max_health)
		check_death()

var dead: bool = false


func _init(new_max_health: int = max_health) -> void:
	max_health = new_max_health


func take_damage(damage: Damage) -> int:
	var previous_health: int = health
	health -= damage.value
	return previous_health - health


func take_heal(heal: Heal) -> int:
	var previous_health: int = health
	health += heal.value
	return health - previous_health


func check_death() -> void:
	if health == 0: dead = true
	died.emit()
