extends Node2D

export var up_torque := 200000 
export var input_key = "ui_right" #: String


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Flipper.input_key = input_key
	$Flipper.up_torque = up_torque



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
