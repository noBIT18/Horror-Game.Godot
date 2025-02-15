extends Node3D

func on_interact():
	var Flashlight = get_node("/root/" + get_tree().current_scene.name + "/player/head/Camera3D/Flashlight/Flashlight")
	Flashlight.picks_up()
	queue_free()
