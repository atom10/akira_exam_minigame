extends Timer

var exam_percent = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	var exam_paper = $".."
	var pass_label: Label = $"../Label"
	pass_label.visible = true
	var theme: LabelSettings = pass_label.label_settings
	exam_percent = float(exam_paper.current_score) / float(exam_paper.exam_length)
	if exam_percent >= exam_paper.pass_threshold:
		pass_label.text = "PASS"
		theme.font_color = Color(0.0,1.0,0.0,1.0)
	else:
		pass_label.text = "FAIL"
		theme.font_color = Color(1.0,0.0,0.0,1.0)
	pass_label.text += "\n" + str(exam_percent*100.0) + "%"
	pass_label.label_settings = theme
	$"../../exit_button".visible = true
		
