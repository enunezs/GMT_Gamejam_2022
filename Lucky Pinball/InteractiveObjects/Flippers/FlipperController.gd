extends RigidBody2D

var up_torque := 200000 
var input_key = "ui_right" #: String



var thrust = Vector2(0, 250)

func _integrate_forces(state):
	
	# TODO: Pending: Limit rotation based on angle?

	var rotation_dir = 0
	if Input.is_action_pressed(input_key):
		rotation_dir += 1
	""""
	if Input.is_action_pressed("ui_left"):
		rotation_dir -= 1
	"""
	applied_torque = rotation_dir * up_torque
