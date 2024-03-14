extends Timer

var exam_percent = 0.0
@onready var pass_label: Label = $"../exam_result"

func _on_timeout():
	_Print_score()

func _Print_score():
	pass_label.visible = true
	exam_percent = float(get_parent().current_score) / float(get_parent().exam_length)
	if exam_percent >= get_parent().pass_threshold:
		pass_label.text = "PASS"
		pass_label.label_settings.font_color = Color(0.0,1.0,0.0,1.0)
	else:
		pass_label.text = "FAIL"
		pass_label.label_settings.font_color = Color(1.0,0.0,0.0,1.0)
	pass_label.text += "\n" + str(exam_percent*100.0) + "%"
