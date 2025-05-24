class_name Child
extends Parent

func _ready():
	super._ready()
	print("Child _ready")

func custom_value():
	return "child"
