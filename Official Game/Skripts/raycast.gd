extends RayCast3D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		if is_colliding():
			var collider = get_collider()
			print("Collision with:", collider)
			if collider and collider.has_method("on_interact"):
				collider.on_interact()
				var flashscene = load("res://Official Game/flashlight.tscn")
				var flashinst = flashscene.instantiate()
				var flashnode = flashinst.get_node("./Flashlight")
				if flashnode.has_method("picks_up"):
					print("First")
					flashnode.picks_up()
