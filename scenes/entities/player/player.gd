extends CharacterBody2D


const SPEED = 200.0

@onready var arm_pivot = $ArmPivot


func _physics_process(delta: float) -> void:
	_aim_at_mouse()


func _aim_at_mouse():
	arm_pivot.look_at(get_global_mouse_position())
