class_name Hitbox
extends Area2D

var damage = 10  

func _ready() -> void:
	collision_layer = 2
	collision_mask = 0
	#despawn
	var timer = Timer.new()
	timer.wait_time = 0.1
	timer.one_shot = true
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	add_child(timer)
	timer.start()
	
	
func _on_timer_timeout() -> void:
	queue_free()
