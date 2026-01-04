class_name Actor
extends Node

@export var data: ActorData = null
@onready var body: ActorBody = $CharacterBody2D

func initialize(actor_data: ActorData) -> bool:
	if actor_data == null:
		push_error("Actor initialization failed: ActorData is null")
		return false
	data = actor_data
	body.apply_data(data)
	return true

func set_ui_mode(val: bool):
	body.set_ui_mode(val)

func _ready() -> void:
	initialize(data) # Debug code: initialize should eventually be called by scene loader, and _initialized flag checked and handled
