class_name Hurtbox
extends Area2D

signal hurt

@export_flags_2d_physics var takes_attacks_from: int


func _ready() -> void:
	collision_layer = takes_attacks_from
	collision_mask = takes_attacks_from
	connect("area_entered", Callable(self, "_on_area_entered"))


func _on_area_entered(hitbox: Hitbox) -> void:
	if !hitbox:
		return

	emit_signal("hurt", hitbox.attack_data)
