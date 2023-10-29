class_name Enemy
extends CharacterBody2D

var level := 2
var defense := 4


func _on_hurtbox_hurt(hit_data) -> void:
	print("Ouch! I took {0} damage!".format([hit_data.damage - defense]))
