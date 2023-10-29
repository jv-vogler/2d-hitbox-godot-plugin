class_name Player
extends CharacterBody2D

var strength := 5
var weapon_damage := 5

@onready var hitbox: Hitbox = $Hitbox


func _ready() -> void:
	_setup_attack_data()


func _setup_attack_data() -> void:
	var player_attack_data = AttackData.new()
	player_attack_data.damage = self.strength + self.weapon_damage

	hitbox.attack_data = player_attack_data


func _on_hitbox_hit(hurt_enemy) -> void:
	print_rich(
		(
			"[color=green][b](Hit)[/b][/color] I hit a level [color=green][b]%s[/b][/color] enemy!"
			% [hurt_enemy.level]
		)
	)


# Player Movement
func _physics_process(delta: float) -> void:
	_move(delta)


func _move(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500

	move_and_slide()
