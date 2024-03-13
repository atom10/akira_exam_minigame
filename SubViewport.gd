extends SubViewport


# Called when the node enters the scene tree for the first time.
func _ready():
	set_size_2d_override(Vector2i(1920, 1080)) # Custom size for 2D.
	set_size_2d_override_stretch(true) # Enable stretch for custom size.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
