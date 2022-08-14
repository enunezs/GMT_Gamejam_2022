extends RigidBody2D

# Score for this dice
var score = 3


func _ready():

	update_sprite()
	
	pass
	
func add_score(_score):
	
	if _score >0:
		$AudioStreamPlayer2D.play()
	
	score += _score
	
	
	while score <= 0:
		#Delete?
		score = +1
	while score > 6:
		score -=1
		
	update_sprite()
	
	#TODO: Play respective animation
	
func get_score():
	return score
	
func update_sprite():
	
	$AnimatedSprite.frame = score
	


func _on_Die_body_entered(body):
	$AudioStreamPlayer2D_wall.play()
	pass # Replace with function body.
