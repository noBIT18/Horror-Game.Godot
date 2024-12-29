extends Node3D

@onready var Light = $SpotLight3D
@onready var Player = "res://Official Game/player.tscn"

var on = false  
var target_rotation = 0  
var down_rotation = deg_to_rad(90)  
var up_rotation = 0  



func _ready():
	Light.visible = false
	set_process(true)


func _process(delta):
	if Input.is_action_just_pressed("flash") and visible:
		on = !on
		Light.visible = on  
		target_rotation = down_rotation if on else up_rotation  

	rotation_degrees.x = lerp(rotation_degrees.x, rad_to_deg(target_rotation), 5 * delta)
