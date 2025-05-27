class_name Parent
extends Node

func _ready():
	print("Parent _ready")
	print(custom_value())  # вызывает текущую версию custom_value()

func custom_value():
	return "parent"


func _on_timer_timeout():
	var node = $"../Child"
	
	var flat_copy := node.duplicate(DUPLICATE_SIGNALS | DUPLICATE_GROUPS | DUPLICATE_SCRIPTS | DUPLICATE_USE_INSTANTIATION)

	var scene = PackedScene.new()
	var result = scene.pack(node)

	var error = ResourceSaver.save(scene, "res://chill.tscn")
