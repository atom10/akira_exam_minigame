extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var timer: Timer = get_node("../../Timer")
	timer.start()
	get_parent().visible = false
	$"../../paper".construct_exam_text()
