extends CharacterBody3D

var SPEED = 5.0
var is_moving = false
const JUMP_VELOCITY = 4.5
const GRAVITY = 9.8
var Timestart
@onready var Timers = $Timer
@onready var wakingup = $AnimationPlayer
@onready var Animations = $head/Camera3D/Flashlight/AnimationPlayer


func _ready():
	Timers.wait_time = 3
	Timers.start()
	Timers.timeout.connect(_on_Timers_timeout)
	Timestart = true

func _on_Timers_timeout():
	Timestart = false

func _physics_process(delta):
	var current_speed = SPEED
	var direction = Vector3.ZERO
	
	await wakingup
	
	
	if Timestart:
		current_speed = 0
	else:
		current_speed = SPEED
	
		
	if Input.is_action_pressed("forward"):
		direction -= transform.basis.z
		
	if Input.is_action_pressed("backward"):
		direction += transform.basis.z
		
	if Input.is_action_pressed("left"):
		direction -= transform.basis.x
		
	if Input.is_action_pressed("right"):
		direction += transform.basis.x
		
	direction = direction.normalized()
	velocity.x = direction.x * current_speed
	velocity.z = direction.z * current_speed

	if not is_on_floor():
		velocity.y -= GRAVITY * delta
	else:
		velocity.y = 0

	if direction.length() > 0:
		is_moving = true
		Animations.play("flashss")
	else:
		Animations.stop()
	move_and_slide()
