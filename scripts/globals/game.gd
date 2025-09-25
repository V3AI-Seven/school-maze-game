extends Node
var game_won = false
var difficulty = "normal"
var timer_on = false
var timer = 0.0

func _process(delta: float) -> void:
	if timer_on:
		timer += delta
