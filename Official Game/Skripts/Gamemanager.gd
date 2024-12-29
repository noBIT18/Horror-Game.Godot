extends Node
class_name Game

@onready var Animations = $"res://Official Game/ui.tscn/MarginContainer/BatterieFlashlight/AnimationPlayer"

# Assign references to each battery level sprite in the editor
var battery1_sprite = "Battery1"
var battery2_sprite = "Battery2"
var battery3_sprite = "Battery3"
var battery4_sprite = "Battery4"

# Battery level definitions
var battery_levels = [battery1_sprite, battery2_sprite, battery3_sprite, battery4_sprite]
var battery_index = 3 # Start with full battery (4 levels, so index 3 is full)
var consuming = true
var battery_life = 100.0 # Starting battery life (100%)
var battery_drain_rate = 10.0 # Battery drain rate per second

func _process(delta):
	if consuming:
		battery_life -= battery_drain_rate * delta
		update_battery()

func update_battery():
	# Determine the current battery level
	if battery_life > 75:
		Animations.play("Battery4")
		battery_index = 3 # Full
	elif battery_life > 50:
		battery_index = 2
	elif battery_life > 25:
		battery_index = 1
	elif battery_life > 0:
		battery_index = 0
	else:
		battery_index = -1 # Battery depleted

	# Update the visibility of battery sprites
	for i in range(len(battery_levels)):
		battery_levels[i].visible = i <= battery_index

	# If battery is depleted, turn off the flashlight
	if battery_index == -1:
		consuming = false
		# Add code here to handle what happens when battery is depleted
