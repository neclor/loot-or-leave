class_name CameraComponent extends Camera2D


@export_group("")
@export var min_zoom: Vector2 = Vector2(0.5, 0.5):
	get = get_min_zoom,
	set = set_min_zoom
@export var max_zoom: Vector2 = Vector2(4, 4):
	get = get_max_zoom,
	set = set_max_zoom


func get_min_zoom() -> Vector2:
	return min_zoom


func set_min_zoom(new_value: Vector2) -> void:
	min_zoom = new_value.clamp(Vector2.ZERO, max_zoom)


func get_max_zoom() -> Vector2:
	return max_zoom


func set_max_zoom(new_value: Vector2) -> void:
	max_zoom = new_value.max(min_zoom)


func zoom_in() -> void:
	if zoom >= max_zoom: return
	zoom *= 1.1
	if zoom > max_zoom: zoom = max_zoom


func zoom_out() -> void:
	if zoom <= min_zoom: return
	zoom /= 1.1
	if zoom < min_zoom: zoom = min_zoom


func zoom_to_min() -> void:
	zoom = min_zoom


func zoom_to_max() -> void:
	zoom = max_zoom
