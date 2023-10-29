@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_custom_type("Hitbox", "Area2D", preload("hitbox.gd"), preload("res://sword.svg"))
	add_custom_type("Hurtbox", "Area2D", preload("hurtbox.gd"), preload("res://shield.svg"))


func _exit_tree() -> void:
	remove_custom_type("Hitbox")
	remove_custom_type("Hurtbox")
