# 2D Hitbox System - Godot Plugin

Hitbox and Hurtbox components for 2D Godot games. This is a simple yet useful system for attacks, environmental damage, and more.

# Quickstart

- Attach a `Hitbox` and/or `Hurtbox` to your entity's Scene and attach a `CollisionShape2D` or `CollisionPolygon2D` to components.

- Select the components `attack_source` and/or `takes_attacks_from` properties in the editor.

- Connect the `hit` and `hurt` signals to your entity's Script so you can use the data passed by the signals.

### Tips:

You can make use multiple hitboxes for different attacks and change their Collision's `disabled` property inside your animations.

You can also disable the player's hurtbox to give them a brief immunity after getting hit, and enable it after a timer expires.

# How it works

This system tries to be as generic and reusable as possible. It notifies when your attack hits, or when something is hit, and then passes relevant data forward alongside the signal.

- Both `Hitbox` and `Hurtbox` components are simply Area2D Nodes, so you have to attach a `CollisionShape2D` or `CollisionPolygon2D` to them.

- They export flags for choosing the attack source and the entity that is getting attacked, like "Player" and "Enemy" for example. You can customize the layer names in `Project > Project Settings > General Tab > Layer Names > 2D Physics`.

- They will emit `hit` and `hurt` signals, passing forward relevant data that other Nodes can consume however they see fit.

## Hitbox

The `Hitbox` Node also exports an `attack_data` Resource. This gives us flexibility to choose whatever method we see fit for representing our attack data (check out the [Command Pattern](https://gameprogrammingpatterns.com/command.html)).

You could add a premade custom resource, or you could create it programatically as well:

```gd
# attack_data.gd
class_name AttackData
extends Resource

var damage: int
# You could also add other properties to your attack like knockback strength, critical hit, etc.
```

```gd
# player.gd
class_name Player
extends CharacterBody2D

var strength := 5
var weapon_damage := 5
@onready var hitbox: Hitbox = $Hitbox

func _ready() -> void:
	var player_attack_data = AttackData.new()
	player_attack_data.damage = self.strength + self.weapon_damage

	hitbox.attack_data = player_attack_data
```

The `hit` signal passes the _owner_ of the hurtbox (the entity getting hit) as an argument.

For example, the player could gain experience per successful hit that would be higher or lower based on the Enemy's level.

## Hurtbox

The `Hurtbox` just has its `hurt` signal, which will pass the hitbox `attack_data` forward.

For example, since the hurt entity would _know_ the power of the attack from the `attack_data`, it could take its own defense into account before calculating the total damage taken.

# License

[MIT](https://choosealicense.com/licenses/mit/) License.
All rights reserved &copy; 2023 JV Vogler.
