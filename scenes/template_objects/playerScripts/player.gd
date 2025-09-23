extends CharacterBody3D

const speed = 10
const sprintSpeed = 15
const mouse_sensitivity = 0.002


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)

		$Marker3D/Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$Marker3D/Camera3D.rotation.x = clampf($Marker3D/Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))

func _physics_process(_delta):
	var targetVelocity = Vector3.ZERO
	var worldTargetVelocity = Vector3.ZERO
	var targetSpeed = speed
	
	if Input.is_key_pressed(KEY_SHIFT):
		targetSpeed = sprintSpeed

	if Input.is_key_pressed(KEY_W):
		targetVelocity.z -= targetSpeed

	if Input.is_key_pressed(KEY_S):
		targetVelocity.z += targetSpeed

	if Input.is_key_pressed(KEY_A):
		targetVelocity.x -= targetSpeed

	if Input.is_key_pressed(KEY_D):
		targetVelocity.x += targetSpeed
		
	worldTargetVelocity = targetVelocity.rotated(Vector3.UP, rotation.y)
	velocity = worldTargetVelocity
	move_and_slide()
