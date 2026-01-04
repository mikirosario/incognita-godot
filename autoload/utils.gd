class_name Utils
extends Node

static func get_prevailing_direction(vector: Vector2) -> Vector2:
	if vector == Vector2.ZERO:
		return Vector2.ZERO
	if abs(vector.x) > abs(vector.y):
		return Vector2.RIGHT if vector.x > 0 else Vector2.LEFT
	return Vector2.DOWN if vector.y > 0 else Vector2.UP
