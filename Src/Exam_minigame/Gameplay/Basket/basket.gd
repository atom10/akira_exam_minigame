extends CharacterBody2D


const SPEED = 300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var exam_paper: TextureRect

func _physics_process(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.has_method("Get_identity"):
		exam_paper.submit_answear(body.Get_identity())
		body.queue_free()
	
