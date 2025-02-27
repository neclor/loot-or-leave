class_name ItemContainer
extends Node


@export_group("Weight Limit")
@export var _weight_limit_enabled: bool = false
@export_range(0, 0, 1, "or_greater") var _weight_limit: int = 0
var _current_weight: int = 0

@export_group("Items Limit")
@export var _items_limit_enabled: bool = false
@export_range(0, 0, 1, "or_greater") var _items_limit: int = 0
var _items_number: int = 0

var _items: Array[Item] = []


#region Items Management
func try_add_item(new_item: Item) -> bool:
	if _weight_limit_enabled:
		if _weight_limit < _current_weight + new_item.weight: return false
	if _items_limit_enabled:
		if _items_limit < _items_number + 1: return false
	if _items.has(new_item): return false

	_items.append(new_item)
	_current_weight += new_item.weight
	_items_number += 1
	return true


func try_remove_item(item: Item) -> bool:
	_items.erase(item)
	if _items_number == _items.size(): return false
	_items_number = _items.size()
	return true
#endregion


#region Weight Limit
func get_weight_limit_enabled() -> bool:
	return _weight_limit_enabled


func try_set_weight_limit_enabled(enabled: bool) -> bool:
	if not enabled:
		_weight_limit_enabled = false
		return true
	if _weight_limit < _current_weight: return false
	_weight_limit_enabled = true
	return true


func get_weight_limit() -> int:
	return _weight_limit


func try_set_weight_limit(new_weight_limit: int) -> bool:
	if _weight_limit_enabled:
		if new_weight_limit < _current_weight: return false
	_weight_limit = maxi(0, new_weight_limit)
	return true


func get_current_weight() -> int:
	return _current_weight
#endregion


#region Items Limit
func get_items_limit_enabled() -> bool:
	return _items_limit_enabled


func try_set_items_limit_enabled(enabled: bool) -> bool:
	if not enabled:
		_items_limit_enabled = false
		return true
	if _items_limit < _items_number: return false
	_items_limit_enabled = true
	return true


func get_items_limit() -> int:
	return _items_limit


func try_set_items_limit(new_items_limit: int) -> bool:
	if _items_limit_enabled:
		if new_items_limit < _items_number: return false
	_items_limit = maxi(0, new_items_limit)
	return true


func get_items_number() -> int:
	return _items_number
#endregion
