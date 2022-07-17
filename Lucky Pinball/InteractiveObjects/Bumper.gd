extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
enum MODE { radial,linear }
export(MODE) var bounce_mode = MODE.linear
export var bumper_force = 100
export var score_change = 0
export var sprite_change = false
export var animate = true
#bounce_mode = "linear"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body): #body is a node
	if animate:
		$AnimationPlayer.play("Bump")
	
	if body == null:
		return
	
	if bounce_mode == MODE.radial:
		
		print(body.name)
		#print(body.angular_damp)
		#if body.name == "Die" :
			# Calculate force direction
		var pos_diff = (global_position - body.global_position).normalized()*bumper_force
		#Apply new force
		body.apply_impulse(Vector2(0, 0),pos_diff)
		#Inform player of score change
		body.add_score(score_change)
	
		
		
		#apply_impulse()# = Vector2(0, 250)
		#body.add_force ()
	
	
	pass # Replace with function body.
