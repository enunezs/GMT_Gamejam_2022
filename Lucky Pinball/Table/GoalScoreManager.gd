extends Node2D

onready var tens_label = $CardBlankTens/Label
onready var ones_label = $CardBlankOnes/Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():

	update_score(0)
	pass # Replace with function body.


func update_score(score):
	print("Setting score to "+ str(score))
	ones_label.text = str(score %10)
	tens_label.text = str((score/10) %10)
	
	pass
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
