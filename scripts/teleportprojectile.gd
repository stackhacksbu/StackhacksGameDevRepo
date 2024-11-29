extends CharacterBody2D
@export var SPEED = 400
var directionX : float
var directionY : float
var spawnPos : Vector2
var spawnRot : float 
var player : Player

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
func _physics_process(delta):
	velocity = Vector2(SPEED * directionX, -SPEED * directionY)
	var collision = move_and_collide(velocity*delta)
	#projectile expires after timer
	var timer = Timer.new()
	timer.wait_time = 0.3
	timer.one_shot = true
	timer.connect("timeout", Callable(self, "_teleport"))
	add_child(timer)
	timer.start()
	if collision:
		_teleport()

func _teleport() -> void:
	player.position = global_position
	queue_free()
