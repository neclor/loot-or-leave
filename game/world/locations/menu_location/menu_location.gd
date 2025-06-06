class_name MenuLocation extends Location


const _CELL_CHAR: String = "#"
const _CELL_SIZE: int = 1
const _STRING_MAP: String = """
#
#_########
#_#_#_#_#
#######_#
"""


func _ready() -> void:
	var cells: Array[Vector2i] = _string_map_to_cells(_STRING_MAP, _CELL_CHAR, _CELL_SIZE)
	terrain_layer.set_cells_terrain_connect(cells, 0, 0)


func _string_map_to_cells(string_map: String, cell_char: String, cell_size: int) -> Array[Vector2i]:
	var cells: Array[Vector2i] = []
	var y: int = 0
	for line in string_map.split("\n", false):
		var x: int = 0
		for c in line:
			if c == cell_char:
				for cell_x in cell_size:
					for cell_y in cell_size:
						cells.append(Vector2i(x * cell_size + cell_x, y * cell_size + cell_y))
			x += 1
		y += 1
	return cells
