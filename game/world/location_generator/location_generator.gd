class_name LocationGenerator extends RefCounted


const _MIN_SIZE: Vector2i = Vector2i(10, 10)
const _MAX_SIZE: Vector2i = Vector2i(18, 18)
const _EXTRA_RECTANGLES_COUNT: int = 4


var _rng: RandomNumberGenerator = RandomNumberGenerator.new()

var seed: int

func _init() -> void:
	randomize()
	pass


func get_seed() -> int:
	pass


func set_seed():
	pass




func generate_room() -> Array[Vector2i]:
	var cells: Array[Vector2i] = []

	var main_rectange_size: Vector2i = Vector2i(rng.randi_range(_MIN_SIZE.x, _MAX_SIZE.x), rng.randi_range(_MIN_SIZE.y, _MAX_SIZE.y))
	
	
	cells.append_array(_generate_rectangle(main_rectange_size))
	
	for i in _EXTRA_RECTANGLES_COUNT:
		rectange_size
		
		
		var offset: Vector2i = Vector2i(
			rng.randi_range(),
			rng.randi_range(),
		)
		pass
	
	
	return cells


func _generate_rectangle(size: Vector2i) -> Array[Vector2i]:
	var cells: Array[Vector2i] = []

	var offset: Vector2i = size / 2
	for x in size.x:
		for y in size.y:
			cells.append(Vector2i(x, y) - offset)

	return cells
