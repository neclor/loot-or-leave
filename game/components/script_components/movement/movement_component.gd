class_name MovementComponent extends Node


@export_group("")
@export_range(0, 100, 1, "or_greater", "hide_slider") var speed: float = 64:
	get = get_speed,
	set = set_speed
@export_range(0.1, 100, 0.1, "or_greater", "hide_slider") var mass: float = 1:
	get = get_mass,
	set = set_mass
@export var character_body: CharacterBody2D = null

var direction: Vector2 = Vector2.ZERO:
	get = get_direction,
	set = set_direction

var _force: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	if character_body == null: return

	character_body.velocity = _force / mass * delta / 2 + direction * speed
	character_body.move_and_slide()

	_force = Vector2.ZERO


func get_speed() -> float:
	return speed


func set_speed(new_value: float) -> void:
	speed = maxf(0, new_value)


func get_mass() -> float:
	return mass


func set_mass(new_value: float) -> void:
	if new_value < 0 || is_zero_approx(new_value): return
	mass = new_value


func get_direction() -> Vector2:
	return direction


func set_direction(new_direction: Vector2) -> void:
	direction = new_direction.normalized()


func apply_force(force: Vector2) -> void:
	_force += force
