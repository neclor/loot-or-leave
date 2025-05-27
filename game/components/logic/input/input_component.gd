class_name InputComponent extends Node


signal input_direction_changed(direction: Vector2)
signal input_
signal scroll_up
signal scroll_down


var _direction: Vector2 = Vector2.ZERO


func _unhandled_input(event: InputEvent) -> void:
	_check_direction()

	if event.is_action_pressed("scroll_up"): scroll_up.emit()
	elif event.is_action_pressed("scroll_down"): scroll_down.emit()


func _check_direction() -> void:
	var new_direction: Vector2 = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))

	if new_direction == _direction: return

	_direction = new_direction
	input_direction_changed.emit(_direction)
