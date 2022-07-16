extends KinematicBody2D

#First, the variables that are used

var _velocity := Vector2(0,0) # The velocity vector
export var gravity := 3000 # Gravity value
var speed :=  200

#delta is the amount of time elapsed during one frame

func _physics_process(delta): #Function that allows the die to move
	_velocity = calculate_move_velocity(_velocity) # separate function
	var collision_info = move_and_collide(_velocity * delta)
	if collision_info: 
		_velocity = _velocity.bounce(collision_info.normal) #
		_velocity *= 0.9

func calculate_move_velocity(linear_velocity: Vector2) -> Vector2: #return a vector
	var out: = linear_velocity  #Linear velocity is a Godot value
	out.y += gravity * get_physics_process_delta_time() 
	return out 

#It's kind of confusing, might need to rework this part to make it clearer
