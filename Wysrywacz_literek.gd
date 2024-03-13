extends TextureRect

var litery = [
	"res://grafiki/a.png",
	"res://grafiki/b.png",
	"res://grafiki/c.png",
	"res://grafiki/d.png"
]

var alfabet = [
	"A",
	"B",
	"C",
	"D"
]

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Mój rozmiar to: " + str(size.x))
	#pass # Replace with function body.

func WysrajLiterke():
	pass


func _on_timer_timeout():
	for n in range(2):
		var letter_x_origib = (randi() % int(size.x))
		var temp_letter_instance = load("res://literka_prafabrykat/literka.tscn")
		var instance = temp_letter_instance.instantiate()
		var index = randi() % 4
		instance.get_node("TextureRect").texture = load(litery[index])
		instance.identity = alfabet[index]
		add_child(instance)
		instance.transform.origin = Vector2(letter_x_origib, position.y)
