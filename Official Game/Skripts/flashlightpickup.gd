extends Node3D

func on_interact():
	var Flashlight = get_node("/root/chapter1/player/head/Camera3D/Flashlight/Flashlight")
	Flashlight.picks_up()
	queue_free()
