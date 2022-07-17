extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var score = 0
var dices = []
var dice_to_spawn = 2
var dice_spawned =0

var cur_score = 0
var score_goal = 0
#var dice = preload("res://node.tscn")
export (PackedScene) var dice_scene
var rng = RandomNumberGenerator.new()

signal new_target_set(target)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	score = 0
	cur_score = 0
	dice_spawned =0
	
	rng.seed = hash("Ema")
	#rng.state = 1 # Restore
	rng.randomize()
	
	score_goal = set_goal()
	dices = []
	_spawn_dice(dice_to_spawn)
	
	pass # Replace with function body.

func set_goal():
	
	score_goal = rng.randi_range(2,12)
	
	$Score.update_score(score_goal)
	#emit_signal("new_target_set", score_goal)
	return score_goal
	
	
func extra_dice():
	_spawn_dice(1)

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
		dice_spawned +=1
	
	
func game_over():
	
	print("Game Over")
	# Erase dice
	for dice in dices:
		dice.queue_free()
	
	# Check if won?
	if cur_score == score_goal:
		#won()
		print("Won! Next round")
		_ready()
	else:
		#lost()	
		print("Boooh! Game lost")
		pass
	
	# If won, spawn new dice and mission
	
	#If lost, kick out to menu
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var dice_on_fall_zone = 0
func _on_DiceFallZone_body_entered(body):
	print("Die: " +  str(body.get_score()) + "has fallen")
	#body.sleeping = true
	cur_score += body.get_score()
	dice_on_fall_zone += 1
	#body.score

	if dice_on_fall_zone == dice_spawned:
		yield(get_tree().create_timer(1.5), "timeout")
		
			
		if dice_on_fall_zone == dice_spawned:
			game_over()
			
			
	
	pass # Replace with function body.


func _on_DiceFallZone_body_exited(body):
	print("Die: " +  str(body.get_score()) + "has exited?")
	body.sleeping = false
	cur_score -= body.get_score()
	#body.score
	if len(dices)>0:
		dice_on_fall_zone -= 1

	
	
