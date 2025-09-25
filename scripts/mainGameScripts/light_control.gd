extends Node3D

var lights = [$DirectionalLight3D, $DirectionalLight3D2, $DirectionalLight3D3, $DirectionalLight3D4]

func disable_lights() -> void:
	for light in lights:
		light.visible = false

func enable_lights() -> void:
	for light in lights:
		light.visible = true
