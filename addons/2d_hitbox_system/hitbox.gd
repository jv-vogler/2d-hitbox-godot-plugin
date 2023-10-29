class_name Hitbox
extends Area2D

signal hit

@export_flags_2d_physics var attack_source: int
@export var attack_data: Resource


func _ready() -> void:
	collision_layer = attack_source
	collision_mask = attack_source
	connect("area_entered", Callable(self, "_on_area_entered"))


func _on_area_entered(hurtbox: Hurtbox) -> void:
	if !hurtbox:
		return

	emit_signal("hit", hurtbox.owner)
