class_name Damage
extends RefCounted


var value: int:
	set(new_value):
		_stat.value = new_value
	get:
		return _stat.value

var _stat: PosStat = PosStat.new()


func _init(new_value: int = 0) -> void:
	value = new_value
