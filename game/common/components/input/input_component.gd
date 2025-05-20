class_name InputComponent extends Node




@export_group("")




func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("scroll_up"):
		pass
		#zoom_in()
	elif event.is_action("scroll_down"):
		pass
		#zoom_out()
