extends RigidBody2D

export var up_torque := 200000 
export var input_key = "ui_right" #: String



var thrust = Vector2(0, 250)

func _integrate_forces(state):
	
	
	if Input.is_action_pressed("ui_up"):
		applied_force = thrust.rotated(rotation)
		print("ui up")
	else:
		applied_force = Vector2()
	var rotation_dir = 0
	if Input.is_action_pressed("ui_right"):
		rotation_dir += 1
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
	applied_torque = rotation_dir * up_torque
