extends Ability
class_name DoubleJump

func use_ability(player: Player) -> void:
	player.velocity.y = player.JUMP_VELOCITY
	player.jump_count += 1
	print("double jump")
	