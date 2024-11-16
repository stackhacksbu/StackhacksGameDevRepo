extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("collide")
	if body is Player:
		body.abilities["doublejump"] = load("res://scripts/movement/doublejump.gd").new()
