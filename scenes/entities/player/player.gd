extends CharacterBody2D


const SPEED = 200.0

@onready var arm_pivot = $ArmPivot
@onready var recoil_comp  = $RecoilComponent
@onready var shoot_comp  = $ShootComponent

func _physics_process(delta: float) -> void:
	_aim_at_mouse()
	move_and_slide()


func _unhandled_input(event):
	if event.is_action_pressed("shoot"):
		var direction    = (get_global_mouse_position() - global_position).normalized()
		var muzzle_pos   = $ArmPivot/Muzzle.global_position
		shoot_comp.shoot(direction)
		recoil_comp.apply(direction, muzzle_pos)


func _aim_at_mouse():
	arm_pivot.look_at(get_global_mouse_position())
