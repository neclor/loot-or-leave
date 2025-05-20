class_name HealthComponent extends StatComponent


signal resurrected(value: int)


@export_group("")
@export var _dead: bool = false


func _init(new_max_value: int = _max_value, new_value: int = _value, dead: bool = _dead) -> void:
	super(new_max_value, new_value)
	set_dead(dead)


func set_value(new_value: int) -> void:
	if _dead: return
	super(new_value)


func is_dead() -> bool:
	return _dead


func set_dead(dead: bool) -> void:
	if dead: kill()
	else: resurrect()


func kill() -> void:
	set_value(0)


func resurrect(new_value: int = _max_value) -> void:
	if not _dead: return
	_dead = false
	set_value(new_value)
	resurrected.emit(_value)


func _check_zero() -> bool:
	if _value != 0: return false

	_dead = true
	on_zero.emit()
	return true
