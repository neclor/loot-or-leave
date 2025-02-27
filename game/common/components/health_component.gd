class_name HealthComponent
extends Node


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
