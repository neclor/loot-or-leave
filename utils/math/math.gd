class_name Math extends Object


static func exp_decay(from: float, to: float, decay: float, delta: float) -> float:
	return lerp(from, to, _calculate_lerp_weight(decay, delta))


static func exp_decay_vector2(from: Vector2, to: Vector2, decay: float, delta: float) -> Vector2:
	return from.lerp(to, _calculate_lerp_weight(decay, delta))


static func exp_decay_vector3(from: Vector3, to: Vector3, decay: float, delta: float) -> Vector3:
	return from.lerp(to, _calculate_lerp_weight(decay, delta))


static func exp_decay_vector4(from: Vector4, to: Vector4, decay: float, delta: float) -> Vector4:
	return from.lerp(to, _calculate_lerp_weight(decay, delta))
 

static func _calculate_lerp_weight(decay: float, delta: float) -> float:
	return 1 - exp(-decay * delta)
