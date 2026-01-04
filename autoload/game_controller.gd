class_name GameController
extends Node

enum GameFlag {
	TALKED_TO_TEST_NPC,
	INTRO_COMPLETE
}

var is_input_locked: bool = false
var flags: Dictionary[GameFlag, bool] = {}
var player_position: Vector2 = Vector2.ZERO

func set_flag(key: GameFlag, value: bool = true) -> void:
	flags[key] = value

func get_flag(key: GameFlag) -> bool:
	return flags.get(key, false)
