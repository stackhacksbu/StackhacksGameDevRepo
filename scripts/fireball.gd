extends Ability
class_name Fireball


	
func use_ability(player: Player) -> void:
	var main = player.get_tree().get_root().get_node("main")
	var projectile = load("res://scenes/projectile.tscn")
	var instance = projectile.instantiate()
	#get mouse position relative to player (center of screen)
	var mouse_pos = player.get_viewport().get_mouse_position() - (player.get_viewport().get_visible_rect().size / 2)
	mouse_pos = Vector2(mouse_pos.x, -mouse_pos.y)
	var direction = mouse_pos.normalized()
	
	instance.directionX = direction.x
	instance.directionY = direction.y
	instance.spawnPos = player.position
	instance.spawnRot = atan2(-direction.x, -direction.y)
	main.add_child.call_deferred(instance)
	print("Fireball!")



	
