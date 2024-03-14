extends TextureButton

func _on_pressed():
	get_parent().queue_free()
