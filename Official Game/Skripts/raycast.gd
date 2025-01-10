extends RayCast3D

@onready var Animations = $"../../AnimationPlayer"


var TIMEROVER
var Lastobject
var collider = get_collider()
var timer
var pointer

# Creates a timer and starts it
func timerstart():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.5
	timer.start()
	timer.timeout.connect(_on_Timers_timeout)
	Animations.play("Pick Up")
	TIMEROVER = false

# Picks up item and changes Variable TIMEOVER to true
func _on_Timers_timeout():
	TIMEROVER = true
	Lastobject.on_interact()


func _process(delta):
	pointer = get_node("/root/chapter1/player/head/Camera3D/UI/CanvasLayer/Container/Sprite2D")
	collider = get_collider()
	
	# Variable TIMEOVER is true removes the child "timer"
	if TIMEROVER:
		remove_child(timer)
	
	
	if is_colliding():
		# When pointer on collider with function "on_interact" change the size of the pointer
		if collider and collider.has_method("on_interact"):
			pointer.scale.x = 0.25
			pointer.scale.y = 0.25
		else:
			pointer.scale.y = 0.3
			pointer.scale.x = 0.3
		
		# when the Interact button is pressed call timerstart and put collider in Lastobject
		if collider and collider.has_method("on_interact") and Input.is_action_just_pressed("Interact"):
			Lastobject = collider
			timerstart()
