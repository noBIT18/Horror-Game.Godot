extends Node3D

func on_interact() -> void:
	var flashscene = load("res://Official Game/player.tscn")
	var flashinst = flashscene.instantiate()
	var flashnode = flashinst.get_node("player/head/Camera3D/Flashlight")
	if flashnode.has_method("picks_up"):
		print("First")
		flashnode.picks_up()
	queue_free()
