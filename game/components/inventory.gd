class_name Inventory
extends Node


@export_group("")
@export_range(0, 0, 1, "or_greater") var _max_weight: int = 0:
	set(new_value):
		_max_weight = maxi(0, new_value)

var _current_weight: int = 0:
	set(new_value):
		_current_weight = clampi(new_value, 0, _max_weight)


func set_max_weight(new_max_weight: int) -> bool:
	
	pass
	


func try_add_item(new_item: Item) -> bool:
	pass
