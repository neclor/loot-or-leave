class_name StatComponent extends Node


signal max_value_changed(max_value: int)
signal value_changed(value: int)
signal value_decreased(amount: int)
signal value_increased(amount: int)
signal on_zero()
signal on_full(value: int)


@export_group("")
@export_range(0, 100, 1, "or_greater") var _max_value: int = 100
@export_range(0, 100, 1, "or_greater") var _value: int = 100


func _init(new_max_value: int = _max_value, new_value: int = new_max_value) -> void:
	set_max_value(new_max_value)
	set_value(new_value)


func get_max_value() -> int:
	return _max_value


func set_max_value(new_max_value: int) -> void:
	var old_max_value: int = _max_value
	_max_value = maxi(0, new_max_value)

	if old_max_value == _max_value: return

	max_value_changed.emit(_max_value)
	var old_value: int = _value
	set_value(_value)
	if old_value == _value and _value == _max_value: on_full.emit(_value)


func get_value() -> int:
	return _value


func set_value(new_value: int) -> void:
	_value = clampi(new_value, 0, _max_value)

	if _value == new_value: return

	value_changed.emit(_value)
	if not _check_zero(): _check_full()


func is_zero() -> bool:
	return _value == 0


func is_full() -> bool:
	return _value == _max_value


func decrease(amount: int) -> void:
	if amount <= 0: return

	var old_value: int = _value
	set_value(_value - amount)
	var difference: int = old_value - _value
	if difference > 0: value_decreased.emit(difference)


func increase(amount: int) -> void:
	if amount <= 0: return

	var old_value: int = _value
	set_value(_value + amount)
	var difference: int = _value - old_value
	if difference > 0: value_increased.emit(difference)


func _check_zero() -> bool:
	if _value != 0: return false

	on_zero.emit()
	return true


func _check_full() -> bool:
	if _value != _max_value: return false

	on_full.emit(_value)
	return true
