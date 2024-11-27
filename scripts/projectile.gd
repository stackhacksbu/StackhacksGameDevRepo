extends CharacterBody2D

@export var SPEED = 200

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
		queue_free()
