extends RayCast3D

var TIMEROVER
@onready var Animations = $"../../AnimationPlayer"
var Lastobject
var collider = get_collider()
var timer


func use():
	Lastobject.on_interact()

func timerstart():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1.5
	timer.start()
	timer.timeout.connect(_on_Timers_timeout)
	Animations.play("Pick Up")
	TIMEROVER = false

func _on_Timers_timeout():
	TIMEROVER = true
	use()


func _process(delta):
	if TIMEROVER:
		remove_child(timer)
	collider = get_collider()
	var pointer = get_node("/root/chapter1/player/head/Camera3D/UI/CanvasLayer/Container/Sprite2D")
	if is_colliding():
		if collider and collider.has_method("on_interact"):
			pointer.scale.x = 0.25
			pointer.scale.y = 0.25
		else:
			pointer.scale.y = 0.3
			pointer.scale.x = 0.3
		if collider and collider.has_method("on_interact") and Input.is_action_just_pressed("Interact"):
			timerstart()
			Lastobject = collider
