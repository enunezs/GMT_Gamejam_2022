extends RigidBody2D

# Score for this dice
var score = 3


func _ready():

	update_sprite()
	
	pass
	
func add_score(_score):
	score += _score
	if score <= 0:
		#Delete?
		score = +6
	elif score > 6:
		score -=6
		
	update_sprite()
	
	#TODO: Play respective animation

func update_sprite():
	
	$AnimatedSprite.frame = score
	
