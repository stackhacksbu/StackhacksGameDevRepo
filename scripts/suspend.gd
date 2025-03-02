extends Ability
class_name Suspend

# Store the player as an instance variable so timeout can reference it
var target_player: Player
var original_velocity_y: float

func use_ability(player: Player) -> void:
	# Update instance variables
	target_player = player
	original_velocity_y = player.velocity.y
	
	# Effect: Stop vertical movement and start hover timer
	player.velocity.y = 0  # Stop vertical movement
	print("Hover activated")

	# Set the player's is_hovering state to true
	player.is_hovering = true

	# Create and configure the timer for hover duration
	var hover_timer = Timer.new()
	hover_timer.wait_time = 2.0  # Set the hover duration (in seconds)
	hover_timer.one_shot = true  # Timer should only run once
	hover_timer.connect("timeout", Callable(self, "_on_hover_timeout"))
	
	# Add the timer to the player's scene tree and start it
	player.add_child(hover_timer)
	hover_timer.start()

func _on_hover_timeout() -> void:
	# Reset the vertical velocity and end the hover effect
	target_player.velocity.y = original_velocity_y
	target_player.is_hovering = false  # Set the player's hover state back to false
	print("Hover ended")
