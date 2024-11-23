extends Ability
class_name Arcaneadrenaline

# Store the player and original_speed as instance variables so timeout can reference them
var target_player: Player
var original_speed: float
var original_jump_velocity: float

func use_ability(player: Player) -> void:
	#update instance vars
	original_speed = player.speed
	original_jump_velocity = player.jump_velocity
	target_player = player
	
	#effects
	player.speed = player.speed * 2
	player.jump_velocity = player.jump_velocity * 1.25
	
	#Ability duration
	var timer = Timer.new()
	timer.wait_time = 3.0  # Set the duration for the effect
	timer.one_shot = true  # The timer should only run once
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))

	# Add the timer to the player's scene tree and start it
	player.add_child(timer)
	timer.start()
	
func _on_timer_timeout() -> void:
	#reset effects
	target_player.speed = original_speed
	target_player.jump_velocity = original_jump_velocity
