extends RayCast3D



func _process(delta):
	var collider = get_collider()
	var pointer = get_node("/root/chapter1/player/head/Camera3D/UI/CanvasLayer/Container/Sprite2D")
	if is_colliding():
		if collider and collider.has_method("on_interact"):
			pointer.scale.x = 0.25
			pointer.scale.y = 0.25
		else:
			pointer.scale.y = 0.3
			pointer.scale.x = 0.3
		if collider and collider.has_method("on_interact") and Input.is_action_just_pressed("Interact"):
			collider.on_interact()
