# Bullet.gd
extends Area2D

@export var speed: float = 600.0
var direction: Vector2 = Vector2.RIGHT

func _ready():
	body_entered.connect(_on_body_entered)
	#$VisibleOnScreenNotifier2D.screen_exited.connect(queue_free)
	rotation = direction.angle()  # orient sprite to match direction

func _physics_process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(10)
	queue_free()
