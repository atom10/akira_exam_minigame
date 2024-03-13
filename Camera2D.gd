extends Camera2D

var initial_window_size = Vector2(1280, 720) # Set your initial window size here

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current_window_size = get_viewport_rect().size
	var zoom_factor_y = current_window_size.y / initial_window_size.y
	var zoom_factor_x = current_window_size.x / initial_window_size.x
	zoom = Vector2(zoom_factor_x, zoom_factor_y)
	#pass
