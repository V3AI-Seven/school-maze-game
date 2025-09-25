extends Node3D

var should_vanish: bool = false

func vanish_event():
	#print("Player can see the wall!")
	should_vanish = randi_range(0, 1) == 1
	if should_vanish:
		#print("Wall Vanishing")
		$StaticBody3D.visible = false
		$StaticBody3D/CollisionShape3D.set_deferred("disabled", true) #Disable collision (bad func names :(
	else:
		#print("Wall appearing")
		$StaticBody3D.visible = true
		$StaticBody3D/CollisionShape3D.set_deferred("disabled", false) #Enable collision (bad func names :(
