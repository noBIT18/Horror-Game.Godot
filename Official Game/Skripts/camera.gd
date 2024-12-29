extends Node3D

var sens = 0.0015
var esc = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta):
	if Input.is_action_just_pressed("esc"):
		esc = !esc 
		if esc:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and not esc:
		get_parent().rotate_y(-event.relative.x * sens)
		rotate_x(-event.relative.y * sens)
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))
