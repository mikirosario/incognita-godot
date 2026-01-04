class_name ActorAnimator
extends AnimatedSprite2D

enum AnimState {
	IDLE_DOWN,
	IDLE_LEFT,
	IDLE_RIGHT,
	IDLE_UP,
	WALK_DOWN,
	WALK_LEFT,
	WALK_RIGHT,
	WALK_UP,
	DEATH
}

var animations_dict: Dictionary[AnimState, String] = {
	AnimState.IDLE_DOWN: "idle_down",
	AnimState.IDLE_LEFT: "idle_left",
	AnimState.IDLE_RIGHT: "idle_right",
	AnimState.IDLE_UP: "idle_up",
	AnimState.WALK_DOWN: "walk_down",
	AnimState.WALK_LEFT: "walk_left",
	AnimState.WALK_RIGHT: "walk_right",
	AnimState.WALK_UP: "walk_up",
	AnimState.DEATH: "death"
}

var last_direction: Vector2 = Vector2.DOWN
var current_state: AnimState = AnimState.IDLE_DOWN

func update_animation(velocity: Vector2) -> void:
	var next_state := _determine_state(velocity)
	if next_state != current_state:
		current_state = next_state
		play(animations_dict[_determine_state(velocity)])

func _determine_state(velocity: Vector2) -> AnimState:
	if velocity.length() > 0.01:
		last_direction = velocity
		return _walk_state_from_dir(last_direction)
	else:
		return _idle_state_from_dir(last_direction)

func _walk_state_from_dir(direction: Vector2) -> AnimState:
	match Utils.get_prevailing_direction(direction):
		Vector2.DOWN:
			return AnimState.WALK_DOWN
		Vector2.LEFT:
			return AnimState.WALK_LEFT
		Vector2.RIGHT:
			return AnimState.WALK_RIGHT
		Vector2.UP:
			return AnimState.WALK_UP
		_:
			return AnimState.WALK_DOWN

func _idle_state_from_dir(direction: Vector2) -> AnimState:
	match Utils.get_prevailing_direction(direction):
		Vector2.DOWN:
			return AnimState.IDLE_DOWN
		Vector2.LEFT:
			return AnimState.IDLE_LEFT
		Vector2.RIGHT:
			return AnimState.IDLE_RIGHT
		Vector2.UP:
			return AnimState.IDLE_UP
		_:
			return AnimState.IDLE_DOWN
