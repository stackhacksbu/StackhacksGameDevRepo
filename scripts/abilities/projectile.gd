extends CharacterBody2D

@export var SPEED = 200
@export var explosion_hitbox: PackedScene = preload("res://scenes/Hitbox.tscn")
var directionX : float
var directionY : float
var spawnPos : Vector2
var spawnRot : float 

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
func _physics_process(delta):
	velocity = Vector2(SPEED * directionX, -SPEED * directionY)
	var collision = move_and_collide(velocity*delta)
	if collision:
		print("HIT!")
		_spawn_explosion(global_position)
		queue_free()
		
func _spawn_explosion(position) -> void:
	#spawn
	var hitbox = explosion_hitbox.instantiate()
	hitbox.global_position = position
	get_parent().add_child(hitbox)
