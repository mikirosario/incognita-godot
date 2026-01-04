class_name SceneFinder
extends Node

func go_to_scene(path: String) -> void:
	get_tree().change_scene_to_file(path)
