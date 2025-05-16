class_name Entity extends CharacterBody2D


@onready var health_component: HealthComponent = %HealthComponent


func _physics_process(_delta: float) -> void:
	move_and_slide()
