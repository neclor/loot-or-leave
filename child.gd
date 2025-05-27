class_name Child
extends Parent


signal signa(l)


var b = 0
@export_storage var a: int = 0


func _ready():
	super._ready()
	print("Child _ready")
	b = 1
	a = 1
	



func custom_value():
	return "child"



func sig(nal):
	pass
