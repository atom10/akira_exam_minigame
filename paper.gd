extends TextureRect

var expected_answer = []
var received_answer = []
const exam_length = 10
var current_score = 0
var pass_threshold = 0.5
@onready var alphabet = get_parent().get_node("Wysrywacz_literek").alfabet

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in exam_length:
		expected_answer.append(alphabet[randi() % alphabet.size()])
	print(expected_answer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func construct_exam_text():
	var text = "[font_size=10][color=black]"
	for n in exam_length:
		text += "bla bla bla \n"
		if n < received_answer.size():
			for letter in alphabet:
				text += ("[color=#0000FF]"+letter+"[/color]") if letter == expected_answer[n] else letter
				if letter == received_answer[n]:
					text += " (" + ("[color=green]X[/color]" if letter==expected_answer[n] else "[color=red]X[/color]") + ")  "
				else:
					text += " ( )  "
		else:
			for letter in alphabet:
				text += (("[color=blue]"+letter+"[/color]") if letter == expected_answer[n] else letter) + " ( )  "
		text += "\n"
	get_node("RichTextLabel").text = text + "\nSCORE: " + str(current_score) + "/" + str(exam_length) + "[/color][/font_size]"
	

func set_text(text):
	get_node("RichTextLabel").text = text

func submit_answear(answear):
	if received_answer.size() < exam_length:
		received_answer.append(answear)
		if received_answer[received_answer.size() - 1] == expected_answer[received_answer.size() - 1]:
			current_score += 1
		construct_exam_text()
		if received_answer.size() >= exam_length:
			$"../Timer".stop()
			$"exam finished timer".start()
