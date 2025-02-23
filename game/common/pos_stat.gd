class_name PosStat
extends RefCounted


var max_value: int = Limits.INT_MAX:
	set(new_value):
		max_value = clamp(new_value, 0, Limits.INT_MAX)
		value = value

var value: int = 0:
	set(new_value):
		value = clamp(new_value, 0, max_value)


func _init(new_max_value: int = Limits.INT_MAX, new_value: int = 0) -> void:
	max_value = new_max_value
	value = new_value
