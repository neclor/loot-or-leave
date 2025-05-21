class_name MovementComponent extends Node


@export_group("")
@export_range(0, 0, 1, "or_greater") var speed: float = 64:
	set(new_value):
		speed = maxf(0, new_value)

@export var mass: float = 1:
	set(new_value):
		if new_value < 0 || is_zero_approx(new_value): return
		mass = new_value

@export var character_body: CharacterBody2D = null

var _force: Vector2 = Vector2.ZERO
var _direction: Vector2 = Vector2.ZERO


func _physics_process(delta: float) -> void:
	if character_body == null: return

	character_body.velocity = _force / mass * delta / 2 + _direction * speed
	character_body.move_and_slide()

	_force = Vector2.ZERO


func set_direction(new_direction: Vector2) -> void:
	_direction = new_direction.normalized()


func apply_force(force: Vector2) -> void:
	_force += force
