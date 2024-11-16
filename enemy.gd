extends Node2D

class_name enemy

const speed = 10
var enemy_chase:bool

var health = 10
var health_max = 10
var health_min = 0

var dead:bool = false
var taking_damage:bool = false

var deal_damage = 10
var is_dealing_damage:bool = false

var dir: Vector2
const gravity = 900
var knockback_force = 200
var is_roaming:bool=true


func _on_timer_timeout() -> void:
	$DirectionTImer.wait_time = choose([1.5, 2.0, 2.5])
	if !enemy_chase:
		dir = choose([Vector2.LEFT, Vector2.RIGHT])


func choose(array):
	array.shuffle()
	return array.front()
	
	
