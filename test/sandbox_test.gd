@tool
extends EditorScript


func _run() -> void:
	pass
	
	
	
	var stat: StatComponent = HealthComponent.new()
	var class_val: Object = StatComponent

	if stat is StatComponent:
		print("status")
	else:
		print("nooo")
	

	
func foo(obj: Object, arg: Object) -> bool:
	return obj is arg
