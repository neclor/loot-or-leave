class_name MainMenu extends CanvasLayer


signal start_button_pressed
signal exit_button_pressed


func _ready() -> void:
	_set_version_label()


func _set_version_label() -> void:
	%VersionLabel.text = "v " + ProjectSettings.get_setting("application/config/version")


func _on_start_button_pressed() -> void:
	start_button_pressed.emit()


func _on_exit_button_pressed() -> void:
	exit_button_pressed.emit()
