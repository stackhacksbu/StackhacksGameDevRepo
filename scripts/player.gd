extends CharacterBody2D
class_name Player

# constants
const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const MAX_JUMPS = 2

# variables
var jump_count = 0  # current number of jumps
var abilities = {}  # hashmap/dictionary of our character's abilities
var is_hovering = false  # Add this variable to track hovering state
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D  # sprite associated with this node
@onready var health_bar: TextureProgressBar = $TextureProgressBar

var hp = 100
# runs on node's creation
func _ready() -> void:
	# load in abilities
	abilities["doublejump"] = load("res://scripts/movement/doublejump.gd").new()
	abilities["dash"] = load("res://scripts/movement/dash.gd").new()
	abilities["suspend"] = load("res://scripts/suspend.gd").new()
	health_bar.value = hp

func _physics_process(delta: float) -> void:
	# Apply gravity when not on the floor and not hovering
	if not is_on_floor() and not is_hovering:
		velocity += get_gravity() * delta

	# Handle normal jump logic
	if is_on_floor():
		jump_count = 0  # reset jump count when on the floor

		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			jump_count += 1

	# Handle double jump logic
	elif Input.is_action_just_pressed("jump") and jump_count < MAX_JUMPS and not is_hovering:
		velocity.y = JUMP_VELOCITY  # apply the jump velocity for double jump
		jump_count += 1  # increment jump count
		cast("doublejump")

	# Trigger Suspend ability (only trigger once)
	if Input.is_action_just_pressed("suspension") and not is_hovering:
		cast("suspend")

	# Handle Dash ability
	if Input.is_action_just_pressed("dash"):
		cast("dash")

	# Get the input direction and handle movement/deceleration
	var direction = Input.get_axis("move_left", "move_right")

	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

# function for using abilities
func cast(ability_name) -> void:
	# cast ability based on name
	if abilities.has(ability_name):
		abilities[ability_name].use_ability(self)

func add_health(amount):
	hp += amount
	clamp(hp, 0, 100)
	print("HP: ", hp)
	health_bar.value = hp
