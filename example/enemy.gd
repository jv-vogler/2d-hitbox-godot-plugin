class_name Enemy
extends CharacterBody2D

var level := 2
var defense := 4


func _on_hurtbox_hurt(hit_data) -> void:
	print_rich(
		(
			"[color=orangered][b](Hurt)[/b][/color] I took [color=orangered][b]%s[/b][/color] damage!"
			% [hit_data.damage - defense]
		)
	)
