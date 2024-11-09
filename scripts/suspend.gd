extends Ability
class_name Suspend


var hover_time: float = 2.0  # in seconds
var is_hovering: bool = false
var hover_timer: float = 0.0

func use_ability(player: Player) -> void:
	if not is_hovering:
		is_hovering = true
		hover_timer = hover_time
		player.velocity.y = 0  # Stop vertical movement
		print("Hover activated")

func process_hover(player: Player, delta: float) -> void:
	if is_hovering:
		hover_timer -= delta
		if hover_timer <= 0:
			is_hovering = false  # End the hovering state
			print("Hover ended")
