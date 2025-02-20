@tool
extends EditorScript


func _run() -> void:
	var stat: PosStat = PosStat.new(-1, -1)
	assert(stat.max_value == 0)
	assert(stat.value == 0)

	stat = PosStat.new(123, 123)
	assert(stat.max_value == 123)
	assert(stat.value == 123)
	
	stat.max_value = 56
	stat.value = 123
	assert(stat.max_value == 56)
	assert(stat.value == 56)

	prints(get_script().resource_path, "COMPLETED")
