class_name PosStat
extends RefCounted


const INT64_MAX: int = (1 << 63) - 1 # 9223372036854775807


var max_value: int = INT64_MAX:
	set(new_value):
		max_value = clamp(new_value, 0, INT64_MAX)
		value = value

var value: int = 0:
	set(new_value):
		value = clamp(new_value, 0, max_value)


func _init(new_max_value: int = INT64_MAX, new_value: int = 0) -> void:
	max_value = new_max_value
	value = new_value
