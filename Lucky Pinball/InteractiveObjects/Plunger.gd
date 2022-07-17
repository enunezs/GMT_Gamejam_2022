extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var max_strength = 300
export var max_hold_time = 3

var cur_hold = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	cur_hold = 0


func _process(delta):
	
	if Input.is_action_pressed("ui_down"):
		plunger_update(delta)
	if Input.is_action_just_released("ui_down"):
		plunger_release()

func plunger_update(delta):
	
	if cur_hold < max_hold_time:
		cur_hold += delta
		
		#print(cur_hold/max_hold_time)
		$PinPoint.position.y =  cur_hold/max_hold_time*max_strength
	pass
	
func plunger_release():
	
	#$RigidBody2D.apply_impulse(Vector2(0,0),Vector2(0,-cur_hold/max_hold_time*max_strength))
	cur_hold = 0
	$PinPoint.position.y =  cur_hold/max_hold_time*max_strength
	pass
	
	
