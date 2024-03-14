extends TextureButton

@export var gameplay_scene: PackedScene

func _on_pressed():
	var gameplay_instance = gameplay_scene.instantiate()
	get_tree().get_root().add_child(gameplay_instance)
	get_parent().visible = false
