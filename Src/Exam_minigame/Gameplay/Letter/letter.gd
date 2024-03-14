extends CharacterBody2D

var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")
var identity = ""
var rotation_speed = (randf() - 0.5) * 10.0
var falling_speed = randi() % 3 + 2

func _physics_process(delta):
	velocity.y = delta * 1e+4 * falling_speed
	rotation += (delta * rotation_speed)
	move_and_slide()

func Get_identity():
	return identity
