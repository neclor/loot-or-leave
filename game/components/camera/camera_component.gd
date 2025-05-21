class_name CameraComponent extends Camera2D


@export_group("")
@export var min_zoom: Vector2 = Vector2(0.5, 0.5):
	set(new_value):
		min_zoom = new_value.maxf(0)

@export var max_zoom: Vector2 = Vector2(4, 4):
	set(new_value):
		max_zoom = new_value.maxf(0)


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
