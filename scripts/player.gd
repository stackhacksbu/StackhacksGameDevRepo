extends CharacterBody2D
class_name Player

# constants
const MAX_JUMPS = 2

# variables
var speed = 130.0
var jump_velocity = -300.0

# current number of jumps
var jump_count = 0
# hashmap/dictionary of our character's abilities
var abilities = {}
# sprite associated with this node
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# runs on node's creation
func _ready() -> void:
	# load in abilities
	abilities["doublejump"] = load("res://scripts/movement/doublejump.gd").new()
	abilities["dash"] = load("res://scripts/movement/dash.gd").new()
	abilities["arcaneadrenaline"] = load("res://scripts/movement/arcaneadrenaline.gd").new()
	abilities["fireball"] = load("res://scripts/fireball.gd").new()

func _draw():
	draw_circle(position, 5, Color(1, 0, 0)) # Red circle
	draw_line(position, get_global_mouse_position(), Color(0, 1, 0)) # Green line
	draw_circle($AnimatedSprite2D.global_position, 5, Color(0, 0, 1))  # Sprite position


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		# handle gravity.
		velocity += get_gravity() * delta

		# only double jump when not on floor (or else character gets 2 jumps from falling state)
		if Input.is_action_just_pressed("jump") and jump_count < MAX_JUMPS:
			cast("doublejump")

	if is_on_floor():
		# reset double jump
		jump_count = 0

		# jump normally from floor
		if Input.is_action_just_pressed("jump"):
			velocity.y = jump_velocity
			jump_count += 1
	
	# Handle Dash.
	if Input.is_action_just_pressed("dash"):
		cast("dash")
		
	if Input.is_action_just_pressed("arcaneadrenaline"):
		cast("arcaneadrenaline")
		
	if Input.is_action_just_pressed("fireball"):
		cast("fireball")

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false;
	elif direction < 0:
		animated_sprite.flip_h = true;
	
	if direction:
		velocity.x = direction * (speed)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	queue_redraw()
# function for using abilities
func cast(ability_name) -> void:
	# cast ability based on name
	if abilities.has(ability_name):
		abilities[ability_name].use_ability(self);
		
		
