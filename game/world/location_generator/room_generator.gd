class_name RoomGenerator extends RefCounted


var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
var generator_seed: int = 0:
	get = get_generator_seed,
	set = set_generator_seed


var extra_rect_count: int = 4:
	get = get_extra_rect_count,
	set = set_extra_rect_count
var min_rect_size: Vector2i = Vector2i(10, 10):
	get = get_min_rect_size,
	set = set_min_rect_size
var max_rect_size: Vector2i = Vector2i(18, 18):
	get = get_max_rect_size,
	set = set_max_rect_size


func _init() -> void:
	randomize_generator()


func get_generator_seed() -> int:
	return generator_seed


func set_generator_seed(new_generator_seed: int) -> void:
	generator_seed = new_generator_seed
	_rng.seed = generator_seed


func randomize_generator() -> void:
	_rng.randomize()
	generator_seed = _rng.seed


func get_extra_rect_count() -> int:
	return extra_rect_count


func set_extra_rect_count(new_extra_rect_count: int) -> void:
	extra_rect_count = max(0, new_extra_rect_count)


func get_min_rect_size() -> Vector2i:
	return min_rect_size


func set_min_rect_size(new_min_rect_size: Vector2i) -> void:
	min_rect_size = new_min_rect_size.clamp(Vector2.ZERO, max_rect_size)


func get_max_rect_size() -> Vector2i:
	return max_rect_size


func set_max_rect_size(new_max_rect_size: Vector2i) -> void:
	max_rect_size = new_max_rect_size.max(min_rect_size)


func generate_room_cells() -> Array[Vector2i]:
	var cells: Array[Vector2i] = []

	var main_rect_size: Vector2i = _rand_vector2i_range(min_rect_size, max_rect_size)
	cells.append_array(_generate_rect_cells(main_rect_size))

	for i in extra_rect_count:
		var rect_size: Vector2i = _rand_vector2i_range(min_rect_size, max_rect_size)
		var offset: Vector2i = _rand_vector2i_range(-main_rect_size / 2, main_rect_size / 2)
		for cell in _generate_rect_cells(rect_size):
			var new_cell: Vector2i = cell + offset
			if cells.has(new_cell): continue
			cells.append(new_cell)

	return cells


func _generate_rect_cells(rect_size: Vector2i) -> Array[Vector2i]:
	var cells: Array[Vector2i] = []

	var offset: Vector2i = rect_size / 2
	for x in rect_size.x:
		for y in rect_size.y:
			cells.append(Vector2i(x, y) - offset)

	return cells


func _rand_vector2i_range(from: Vector2i, to: Vector2i) -> Vector2i:
	return Vector2i(_rng.randi_range(from.x, to.x), _rng.randi_range(from.y, to.y))
