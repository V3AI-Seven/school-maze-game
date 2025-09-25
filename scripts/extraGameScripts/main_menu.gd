extends Control

func start() -> void:
	Game.timer_on = true
	get_tree().change_scene_to_file("res://scenes/game/maze.tscn")

func difficulty_change(index) -> void:
	if index == 0:
		Game.difficulty = "normal"
	elif index == 1:
		Game.difficulty = "hard"
