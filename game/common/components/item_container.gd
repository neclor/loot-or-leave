class_name ItemContainer
extends Node


@export_group("Weight Limit")
@export() var weight_limit_enabled: bool = false
@export_range(0, 0, 1, "or_greater") var _weight_limit: int = 0:
	set(new_value):
		_weight_limit = maxi(0, new_value)

var _current_weight: int = 0:
	set(new_value):
		_current_weight = clampi(new_value, 0, _weight_limit)

@export_group("Items Limit")
@export var items_limit_enabled: bool = false
@export_range(0, 0, 1, "or_greater") var _items_limit: int = 0:
	set(new_value):
		_items_limit = maxi(0, new_value)

var _items_number: int = 0:
	set(new_value):
		_items_number = clampi(new_value, 0, _items_limit)

var _items: Array[Item] = []


func _ready() -> void:
	pass


func try_set_weight_limit_enabled(enabled: bool) -> bool:
	if not enabled:
		weight_limit_enabled = false
		return true
	if _weight_limit < _current_weight: return false
	weight_limit_enabled = true
	return true


func try_set_weight_limit(new_weight_limit: int) -> bool:
	if weight_limit_enabled:
		if new_weight_limit < _current_weight: return false
	_weight_limit = new_weight_limit
	return true


func get_current_weight() -> int:
	return _current_weight


func try_set_items_limit_enabled(enabled: bool) -> bool:
	if not enabled:
		items_limit_enabled = false
		return true
	if _items_limit < _items_number: return false
	items_limit_enabled = true
	return true


func try_set_items_limit(new_items_limit: int) -> bool:
	if items_limit_enabled:
		if new_items_limit < _items_number: return false
	_items_limit = new_items_limit
	return true


func get_items_number() -> int:
	return _items_number


func try_add_item(new_item: Item) -> bool:
	if weight_limit_enabled:
		if _weight_limit < _current_weight + new_item.weight: return false
	if items_limit_enabled:
		if _items_limit <= _items_number: return false
	if _items.has(new_item): return false

	_items.append(new_item)
	_current_weight += new_item.weight
	_items_number += 1
	return true


func try_erase_item(item: Item) -> bool:
	_items.erase(item)
	if _items_number == _items.size(): return false
	_items_number -= 1
	return true
