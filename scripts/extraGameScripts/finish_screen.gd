extends Control

func time_convert(time_in_sec):
	var seconds = int(time_in_sec)%60
	var minutes = (int(time_in_sec)/60)%60
	var hours = (int(time_in_sec)/60)/60
	
	#returns a string with the format "HH:MM:SS"
	return "%02d:%02d:%02d" % [hours, minutes, seconds]

func _ready() -> void:
	if Game.game_won:
		$winOrLoseInsult.text = "You Win!"
		$timer.text = "Congratulations! Life wasted: " + time_convert(Game.timer)
	else:
		$winOrLoseInsult.text = "You Lose!"
		$timer.text = "You suck! Life wasted: " + time_convert(Game.timer)
