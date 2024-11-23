extends Area2D
@onready var player: Player = $"../Player"

func _on_body_entered(body):
	print("add_health")
	player.add_health(10)
