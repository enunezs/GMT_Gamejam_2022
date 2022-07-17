extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var total_lights = 0
var cur_lights = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	total_lights = get_child_count()
	var children = get_children()
	
	for child in children:
		child._ready() 
	cur_lights = 0
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func lights_up(son):
	print(son.name)
	cur_lights +=1
	if cur_lights == total_lights:
		get_parent()._spawn_dice(1)
		_ready()
		pass
