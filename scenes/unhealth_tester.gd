extends Area2D
@onready var player: Player = $"../Player"


func _on_body_entered(body: Node2D) -> void:
	print ("ouuuucchhh!!")
	player.subtract_health(10)
	
