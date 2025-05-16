extends Control

func set_score(new_score):
	$Panel/scorelabel.text = "SCORE: " + str(new_score)

func _on_retrybutton_pressed():
	get_tree().reload_current_scene()
