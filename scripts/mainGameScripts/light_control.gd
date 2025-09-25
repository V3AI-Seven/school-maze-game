extends Node3D

func _ready() -> void:
	if Game.difficulty == "normal":
		enable_lights()
	elif Game.difficulty == "hard":
		disable_lights()

func disable_lights() -> void:
	$DirectionalLight3D.visible = false
	$DirectionalLight3D2.visible = false
	$DirectionalLight3D3.visible = false
	$DirectionalLight3D4.visible = false

func enable_lights() -> void:
	$DirectionalLight3D.visible = true
	$DirectionalLight3D2.visible = true
	$DirectionalLight3D3.visible = true
	$DirectionalLight3D4.visible = true
