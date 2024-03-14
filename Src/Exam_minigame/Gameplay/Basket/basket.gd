extends CharacterBody2D


const SPEED = 300.0
var direction
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var mouse_position
@export var exam_paper: TextureRect
@export var contol_method: Control_method

func _physics_process(_delta):
	if contol_method == Control_method.keyboard:
		direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		move_and_slide()


func _on_area_2d_body_entered(body):
	if body.has_method("Get_identity"):
		exam_paper.submit_answear(body.Get_identity())
		body.queue_free()
	
func _process(delta):
	if contol_method == Control_method.mouse:
		mouse_position = get_viewport().get_mouse_position()
		position.x = mouse_position.x

enum Control_method {
	mouse,
	keyboard
}
