class_name MovementComponent extends Node


@export_group("")
@export_range(0, 0, 1, "or_greater") var speed: float = 200:
	set(new_value):
		speed = maxf(0, new_value)

var acceleration: Vector2 = Vector2.ZERO

var direction: Vector2 = Vector2.ZERO:
	set(new_value):
		direction = new_value.normalized()


@onready var character: CharacterBody2D = get_parent() as CharacterBody2D


func move(delta: float) -> void:
	character.velocity = direction * speed + acceleration * delta / 2
	character.move_and_slide()
