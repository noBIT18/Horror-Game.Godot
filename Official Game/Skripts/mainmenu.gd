extends Control

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
		for Button in AButtons:
			Button.visible = false
			Back.visible = true
			HTPT.visible = true
	if Back.button_pressed:
		Back.visible = false
		HTPT.visible = false
		for Button in AButtons:
			Button.visible = true
	if PlayGame.button_pressed:
		get_tree().change_scene_to_file("res://Official Game/Chapter1.tscn")
	if Quit.button_pressed:
		get_tree().quit()
