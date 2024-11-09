extends CharacterBody2D
class_name Player

# constants
const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const MAX_JUMPS = 2

# variables
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
	abilities["suspend"] = load("res://scripts/suspend.gd").new()

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
			velocity.y = JUMP_VELOCITY
			jump_count += 1
			
	
		
	
		# Normal gravity handling when not hovering
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Rest of the movement and ability logic...
	if Input.is_action_just_pressed("suspension"):  # Add a new input for "hover"
		cast("suspend")
	
	# Handle Dash.
	if Input.is_action_just_pressed("dash"):
		cast("dash")

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false;
	elif direction < 0:
		animated_sprite.flip_h = true;
	
	if direction:
		velocity.x = direction * (SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	


# function for using abilities
func cast(ability_name) -> void:
	# cast ability based on name
	if abilities.has(ability_name):
		abilities[ability_name].use_ability(self);
