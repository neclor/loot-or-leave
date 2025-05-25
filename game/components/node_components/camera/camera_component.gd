class_name CameraComponent extends Camera2D


@export_group("Zoom")
@export var min_zoom: Vector2 = Vector2(2, 2):
	get = get_min_zoom,
	set = set_min_zoom
@export var max_zoom: Vector2 = Vector2(4, 4):
	get = get_max_zoom,
	set = set_max_zoom

@export_group("Mouse Drag", "_mouse_drag_")
#@export_range(0, 1, 0.01) var _mouse_drag_left_margin: float = 0.5
#@export_range(0, 1, 0.01) var _mouse_drag_top_margin: float = 0.5
#@export_range(0, 1, 0.01) var _mouse_drag_right_margin: float = 0.5
#@export_range(0, 1, 0.01) var _mouse_drag_bottom_margin: float = 0.5


func _init() -> void:
	zoom = min_zoom


func _process(_delta: float) -> void:
	#var viewport_size: Vector2 = get_viewport_rect().size / zoom
	#var mouse_local_position: Vector2 = get_local_mouse_position()

	#TODO: camera mouse drag

	position = get_local_mouse_position()

	#var normalized_mouse_position: Vector2 = mouse_local_position / viewport_size * 2
	#print(normalized_mouse_position)

	#if normalized_mouse_position.x < -_mouse_drag_left_margin or normalized_mouse_position.x > _mouse_drag_right_margin:
		#position.x = mouse_local_position.x
	#else:
		#position.x = 0
	#if normalized_mouse_position.y < -_mouse_drag_top_margin or normalized_mouse_position.y > _mouse_drag_bottom_margin:
		#position.y = mouse_local_position.y
	#else:
		#position.y = 0
		


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
