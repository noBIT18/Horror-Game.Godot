extends Control

@onready var PlayGame = $Button
@onready var Quit = $Button2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if PlayGame.button_pressed:
		get_tree().change_scene_to_file("res://Official Game/Chapter1.tscn")
	if Quit.button_pressed:
		get_tree().quit()
