extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var lights_on = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	lights_on = false
	
	$AnimatedSprite.frame = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if not lights_on:
		lights_on = true
		$AnimatedSprite.frame = 1
	
		get_parent().lights_up(self)
	
	pass # Replace with function body.
