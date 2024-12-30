extends RayCast3D



func _process(delta):
	var collider = get_collider()
	var pointer = get_node("/root/chapter1/player/head/Camera3D/UI/CanvasLayer/Container/Screenshot2024-10-13031926")
	if is_colliding():
		if collider and collider.has_method("on_interact"):
			pointer.scale.x = 0.7
			pointer.scale.y = 0.7
		else:
			pointer.scale.y = 1
			pointer.scale.x = 1
	if Input.is_action_just_pressed("Interact"):
		if is_colliding():
			print("Collision with:", collider)
			if collider and collider.has_method("on_interact"):
				collider.on_interact()
