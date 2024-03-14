extends TextureRect

@export var exam_length = 10
@export var pass_threshold = 0.5
@export var letter_shared_data: Node
@export var letter_spawner: Control
var expected_answer: Array[String] = []
var received_answer: Array[String] = []
var current_score = 0

func _ready():
	for n in exam_length:
		expected_answer.append(letter_shared_data.letters[randi() % letter_shared_data.letters.size()])

func _Render_exam_text():
	var text = "[font_size=10][color=black]"
	for n in exam_length:
		text += "bla bla bla \n"
		if n < received_answer.size():
			for letter in letter_shared_data.letters:
				text += ("[color=#0000FF]"+letter+"[/color]") if letter == expected_answer[n] else letter
				if letter == received_answer[n]:
					text += " (" + ("[color=green]X[/color]" if letter==expected_answer[n] else "[color=red]X[/color]") + ")  "
				else:
					text += " ( )  "
		else:
			for letter in letter_shared_data.letters:
				text += (("[color=blue]"+letter+"[/color]") if letter == expected_answer[n] else letter) + " ( )  "
		text += "\n"
	$content.text = text + "\nSCORE: " + str(current_score) + "/" + str(exam_length) + "[/color][/font_size]"

func submit_answear(answear):
	if received_answer.size() < exam_length:
		received_answer.append(answear)
		if received_answer[received_answer.size() - 1] == expected_answer[received_answer.size() - 1]:
			current_score += 1
		_Render_exam_text()
		if received_answer.size() >= exam_length:
			Finish_exam()

func Finish_exam():
	$"finish_delay".start()
	letter_spawner._Stop_repeater()
	get_parent().final_score = float(current_score) / float(exam_length)
	get_parent().Finalize()
