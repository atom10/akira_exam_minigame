extends Node2D

var final_score: float = 0.0 # updated once completed

# Called when the node enters the scene tree for the first time.
func _ready():
	$exam._Render_exam_text()
	$letter_spawner._Start_repeater()

# called on minigame end
func Finalize():
	pass
