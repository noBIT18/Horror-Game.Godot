extends Area3D

signal sigma

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact"):
		sigma.emit()

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		print(body.name, " Entered")
		globals.labeltext = "What is going on here?"
		await self.sigma
		globals.labeltext = " "
