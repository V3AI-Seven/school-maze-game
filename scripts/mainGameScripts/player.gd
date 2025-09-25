extends CharacterBody3D

const speed = 10
const sprint_speed = 15
const mouse_sensitivity = 0.002


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)

		$Marker3D/Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$Marker3D/Camera3D.rotation.x = clampf($Marker3D/Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))

func _physics_process(_delta):
	var target_velocity = Vector3.ZERO
	var world_target_velocity = Vector3.ZERO
	var target_speed = speed
	
	if Input.is_key_pressed(KEY_ESCAPE):
		Game.timer_on = false
		Game.game_won = false
		get_tree().change_scene_to_file("res://scenes/menus/finish_screen.tscn")
	
	if Input.is_key_pressed(KEY_SHIFT):
		target_speed = sprint_speed

	if Input.is_key_pressed(KEY_W):
		target_velocity.z -= target_speed

	if Input.is_key_pressed(KEY_S):
		target_velocity.z += target_speed

	if Input.is_key_pressed(KEY_A):
		target_velocity.x -= target_speed

	if Input.is_key_pressed(KEY_D):
		target_velocity.x += target_speed

	world_target_velocity = target_velocity.rotated(Vector3.UP, rotation.y)
	velocity = world_target_velocity
	move_and_slide()
