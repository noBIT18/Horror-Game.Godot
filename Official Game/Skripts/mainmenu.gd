extends Control

@onready var sound = $"Mixkit-hard-typewriter-click-1119"
@onready var PlayGame = $Button
@onready var Quit = $Button2
@onready var HTP = $Button3
@onready var Back = $Button4
@onready var HTPT = $Label2

var AButtons = []

# Called when the node enters the scene tree for the first time.
func _ready():
	AButtons = [HTP, PlayGame, Quit]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if HTP.button_pressed:
		sound.play()
		for Button in AButtons:
			Button.visible = false
			Back.visible = true
			HTPT.visible = true
	if Back.button_pressed:
		sound.play()
		Back.visible = false
		HTPT.visible = false
		for Button in AButtons:
			Button.visible = true
	if PlayGame.button_pressed:
		sound.play()
		get_tree().change_scene_to_file("res://Official Game/Chapter1.tscn")
	if Quit.button_pressed:
		sound.play()
		get_tree().quit()
