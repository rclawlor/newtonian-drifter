# RecoilComponent.gd
extends Node

@export var linear_strength:  float = 300.0
@export var angular_strength: float = 1.0
@export var linear_damping:   float = 4.0    # higher = stops faster
@export var angular_damping:  float = 2.0

var _linear_vel  := Vector2.ZERO
var _angular_vel := 0.0

func apply(shoot_direction: Vector2, muzzle_global_pos: Vector2) -> void:
	var player        = get_parent()
	var muzzle_offset = muzzle_global_pos - player.global_position
	var torque        = muzzle_offset.cross(shoot_direction)

	_linear_vel  += -shoot_direction * linear_strength
	_angular_vel += -torque * angular_strength

func _physics_process(delta):
	if _linear_vel.length() < 0.1 and absf(_angular_vel) < 0.01:
		_linear_vel  = Vector2.ZERO
		_angular_vel = 0.0
		return

	get_parent().velocity += _linear_vel * delta
	get_parent().get_node("Sprite2D").rotation += _angular_vel * delta

	# exponential decay — smooth tail-off, never abrupt
	_linear_vel  = _linear_vel.lerp(Vector2.ZERO, linear_damping * delta)
	_angular_vel = lerpf(_angular_vel, 0.0, angular_damping * delta)
