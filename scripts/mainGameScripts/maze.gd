extends Node3D

func player_left_maze(_body) -> void:
	Game.game_won = true
	Game.timer_on = false
	get_tree().change_scene_to_file("res://scenes/menus/finish_screen.tscn")
