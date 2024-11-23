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
	move_and_slide()

func _on_area_2d_body_entered(body):
	print("HIT")
	queue_free()
