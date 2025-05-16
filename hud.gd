extends Control

@onready var score = $score
@onready var lives_left = $livesleft

func set_score_label(new_score):
	score.text = "SCORE: " + str(new_score)

func set_lives(amount):
	lives_left.text = str(amount)
