extends RayCast3D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		if is_colliding():
			var collider = get_collider()
			print("Collision with:", collider)
			if collider and collider.has_method("on_interact"):
				collider.on_interact()
