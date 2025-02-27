class_name EffectContainer
extends Node2D


@export_group("Effect Limit")
@export var _effect_limit_enabled: bool = false
@export_range(0, 0, 1, "or_greater") var _effect_limit: int = 0:
	set(new_value):
		_effect_limit = maxi(0, new_value)


func try_set_effect_limit_enabled(enabled: bool) -> bool:
	if not enabled:
		effect_limit_enabled = false
		return true
	if _effect_limit < get_effects_number(): return false
	effect_limit_enabled = true
	return true


func try_set_effect_limit(new_effect_limit: int) -> bool:
	if effect_limit_enabled:
		if new_effect_limit < get_effects_number(): return false
	_effect_limit = new_effect_limit
	return true


func get_effects_number() -> int:
	return get_child_count()


func try_add_effect(new_effect: Effect) -> bool:
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
