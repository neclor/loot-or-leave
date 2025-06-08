class_name LocationGenerator extends RefCounted


var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
var generator_seed: int = 0:
	get = get_generator_seed,
	set = set_generator_seed


var _room_generator: RoomGenerator = RoomGenerator.new()


var min_room_count: int = 1:
	get = get_min_rect_size,
	set = set_min_rect_size
var max_room_count: int = 5:
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


func 
