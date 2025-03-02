extends TextureProgressBar
@onready var player: Player = $".."

var textures = [
	load("res://assets/health bars/health_0.png"),
	load("res://assets/health bars/health_10.png"),
	load("res://assets/health bars/health_20.png"),
	load("res://assets/health bars/health_30.png"),
	load("res://assets/health bars/health_40.png"),
	load("res://assets/health bars/health_50.png"),
	load("res://assets/health bars/health_60.png"),
	load("res://assets/health bars/health_70.png"),
	load("res://assets/health bars/health_80.png"),
	load("res://assets/health bars/health_90.png"),
	load("res://assets/health bars/health_100.png")		
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_over = load("res://assets/health bars/health_100.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var index = int(player.hp / 10) 
	texture_over = textures[index]
