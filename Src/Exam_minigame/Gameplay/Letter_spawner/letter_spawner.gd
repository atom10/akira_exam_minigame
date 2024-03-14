extends Control

@export var letter_data: Node
@export var instances_to_spawn_at_once = 2
@export var letter_scene: PackedScene

func _Start_repeater():
	$spawner_repeater.start()
func _Stop_repeater():
	$spawner_repeater.stop()

func _on_timer_timeout():
	for n in range(instances_to_spawn_at_once):
		var letter_x_origin = (randi() % int(size.x))
		var letter_instance = letter_scene.instantiate()
		var index = randi() % 4
		letter_instance.get_node("TextureRect").texture = letter_data.letter_graphics[index]
		letter_instance.identity = letter_data.letters[index]
		add_child(letter_instance)
		letter_instance.transform.origin = Vector2(letter_x_origin, position.y)
