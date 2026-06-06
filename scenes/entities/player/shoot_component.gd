# ShootComponent.gd
extends Node

@export var bullet_scene: PackedScene
@export var fire_rate: float = 0.2

var _cooldown := 0.0

func _process(delta):
	if _cooldown > 0:
		_cooldown -= delta

func shoot(direction: Vector2) -> void:
	if _cooldown > 0:
		return
	_cooldown = fire_rate

	var bullet = bullet_scene.instantiate()
	bullet.direction = direction
	bullet.global_position = get_parent().get_node("ArmPivot/Muzzle").global_position
	get_tree().current_scene.add_child(bullet)
