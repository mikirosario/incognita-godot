class_name ActorBody
extends CharacterBody2D

@onready var animator: ActorAnimator = $AnimatedSprite2D
var speed: float = 1.0
var _input_enabled: bool = true

func apply_data(data: ActorData) -> void:
	speed = data.speed

func set_ui_mode(enabled: bool) -> void:
	_input_enabled = !enabled
	velocity = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	if _input_enabled:
		var input_vector: Vector2 = Input.get_vector(
			"move_left",
			"move_right",
			"move_up",
			"move_down"
		)
		# velocity = input_vector.normalized() * speed
		velocity = input_vector * speed
		animator.update_animation(velocity)
		move_and_slide()
