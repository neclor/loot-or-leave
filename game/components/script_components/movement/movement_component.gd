class_name MovementComponent extends Node


@export_group("")
@export var character_body: CharacterBody2D = null
@export_range(0.1, 100, 0.1, "or_greater", "hide_slider") var mass: float = 1:
	get = get_mass,
	set = set_mass

@export_group("Speed")
@export_range(0, 100, 1, "or_greater", "hide_slider") var walk_speed: float = 64:
	get = get_walk_speed,
	set = set_walk_speed
@export_range(0, 100, 1, "or_greater", "hide_slider") var run_speed: float = 128:
	get = get_run_speed,
	set = set_run_speed


var direction: Vector2 = Vector2.ZERO:
	get = get_direction,
	set = set_direction

var _force: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	if character_body == null: return

	character_body.velocity = _force / mass * delta / 2 + direction * speed
	character_body.move_and_slide()

	_force = Vector2.ZERO


func get_walk_speed() -> float:
	return speed


func set_walk_speed(new_walk_speed: float) -> void:
	speed = maxf(0, new_walk_speed)


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
