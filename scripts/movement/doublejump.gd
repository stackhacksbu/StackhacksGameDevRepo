extends Ability
class_name DoubleJump
#
#func _init() -> void:
	#cooldown = 0;
	#cast_time = 0;
	#capacity = 1;

func use_ability(player: Player) -> void:
	player.velocity.y = player.JUMP_VELOCITY
	print("double jump")
	
