class_name TextFinder
extends Node

enum TextId {
	CONV_000_LINE_000
}

var text_db: Dictionary = {}
const MISSING_TEXT_ERR: String = "[MISSING TEXT]"
const MISSING_ID_ERR: String = "[UNKNOWN TEXT ID]"

func _ready() -> void:
	text_db = JSON.parse_string(FileAccess.get_file_as_string("res://data/text.json"))

func find_text(id: String, lang := "en") -> String:
	if text_db.has(id):
		return text_db[id].get(lang, MISSING_TEXT_ERR)
	return MISSING_ID_ERR
