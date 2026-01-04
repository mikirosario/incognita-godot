class_name ActorBody
extends CharacterBody2D

@onready var animator: ActorAnimator = $AnimatedSprite2D
var speed: float = 1.0

func apply_data(data: ActorData) -> void:
	speed = data.speed

func _physics_process(_delta: float) -> void:
	var input_vector: Vector2 = Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

	velocity = input_vector * speed
	animator.update_animation(velocity)
	move_and_slide()
