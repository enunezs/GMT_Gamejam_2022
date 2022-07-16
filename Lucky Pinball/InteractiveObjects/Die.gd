extends RigidBody2D

var set_up = true 
var direction = 0 
var move_speed = 80


# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	linear_velocity = Vector2(move_speed * direction, 0) #Vector x and y
	# Y velocity vector is already an editable parameter of Godot
	if Input.is_action_just_pressed("click"):
		gravity_scale = 2.0
# Called every frame. 'delta' is the elapsed time since the previous frame.

