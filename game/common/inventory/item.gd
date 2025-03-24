class_name Item
extends Node2D


@export_group("")
@export_range(0, 0, 1, "or_greater") var weight: int = 0:
	set(new_value):
		weight = maxi(0, new_value)


func _init() -> void:
	pass


func _ready() -> void:
	pass



func try_apply_effect(parent: Node) -> bool:
	if not parent.has_method("try_add_effect"): return false
	
	return false



func try_remove_effect() -> bool:
	return false
