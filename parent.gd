class_name Parent
extends Node

func _ready():
	print("Parent _ready")
	print(custom_value())  # вызывает текущую версию custom_value()

func custom_value():
	return "parent"
