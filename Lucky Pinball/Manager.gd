extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0
var dices = []
var dice_goal = 0
#var dice = preload("res://node.tscn")
export (PackedScene) var dice_scene
var rng = RandomNumberGenerator.new()

signal new_target_set(target)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	score = 0
	
	rng.seed = hash("Ema")
	#rng.state = 1 # Restore
	rng.randomize()
	
	dice_goal = set_goal()

	_spawn_dice(2)
	
	pass # Replace with function body.

func set_goal():
	
	dice_goal = rng.randi_range(2,12)
	
	$Score.update_score(dice_goal)
	#emit_signal("new_target_set", dice_goal)
	return dice_goal
	
	

func _spawn_dice(num):
	
	

	for i in range(num):
		var dices_spawn_location = get_node("SpawnLocation").position
		var scene = preload("res://InteractiveObjects/Dice/Die.tscn")
		var instance = scene.instance()
		add_child(instance)
		#instance.set_pos(dices_spawn_location)
		instance.position = dices_spawn_location
		add_child(instance)
		dices.append(instance)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
