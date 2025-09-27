extends Control

func time_convert(time_in_sec):
	var seconds = int(time_in_sec)%60
	@warning_ignore("integer_division")
	var minutes = (int(time_in_sec)/60)%60
	@warning_ignore("integer_division")
	var hours = (int(time_in_sec)/60)/60
	
	#returns a string with the format "HH:MM:SS"
	return "%02d:%02d:%02d" % [hours, minutes, seconds]

func play_again() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

func _ready() -> void:
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if Game.game_won:
		$SuccessFanfareTrumpets6185.play()
		$winOrLoseInsult.text = "You Win!"
		$timer.text = "Congratulations! Life wasted: " + time_convert(Game.timer)
	else:
		$CartoonFailTrumpet278822.play()
		$winOrLoseInsult.text = "You Lose!"
		$timer.text = "You suck! Life wasted: " + time_convert(Game.timer)
