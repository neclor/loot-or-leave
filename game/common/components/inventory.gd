class_name Inventory
extends ItemContainer


@onready var parent: Entity = get_parent()


#region Items Management
func try_add_item(new_item: Item) -> bool:
	if not super(new_item): return false
	# new_item.try_add_effect(parent)
	return true


func try_erase_item(item: Item) -> bool:
	_items.erase(item)
	if _items_number == _items.size(): return false
	_items_number = _items.size()
	return true
#endregion
