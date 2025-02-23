class_name Heal
extends RefCounted


var value: int = 0:
	set(new_value):
		value = clamp(new_value, 0, Limits.INT_MAX)


func _init(new_value: int = 0) -> void:
	value = new_value
