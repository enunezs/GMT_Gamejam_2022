extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()
	


func _on_StartButton_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Quitbutton_pressed():
	get_tree().quit()
