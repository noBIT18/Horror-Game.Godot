extends Node3D
@onready var Sound = $AudioStreamPlayer3D
@onready var Light = $SpotLight3D
@onready var Player = "res://Official Game/player.tscn"

var on = false  
var target_rotation = 0  
var down_rotation = deg_to_rad(90)  
var up_rotation = 0  
var picked_up 


func _ready():
	Light.visible = false
	set_process(true)
	picked_up = false

func picks_up():
	picked_up = true

func _process(delta):
	if picked_up:
		visible = true
	else:
		visible = false
	if Input.is_action_just_pressed("flash") and visible:
		Sound.playing = true
		on = !on
		Light.visible = on  
		target_rotation = down_rotation if on else up_rotation  

	rotation_degrees.x = lerp(rotation_degrees.x, rad_to_deg(target_rotation), 5 * delta)
