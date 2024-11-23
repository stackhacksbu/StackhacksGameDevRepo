extends TextureProgressBar
@onready var player: Player = $".."


func _ready() -> void:
	texture_over = preload("res://assets/health bars/health_100.png")
	print (player.hp)
	
func _process(delta: float) -> void:
	if (player.hp == 100):
		texture_over = preload("res://assets/health bars/health_100.png")
	elif (player.hp == 90):
		texture_over = preload("res://assets/health bars/health_90.png")
	elif (player.hp == 80):
		texture_over = preload("res://assets/health bars/health_80.png")
	elif (player.hp == 70):
		texture_over = preload("res://assets/health bars/health_70.png")
	elif (player.hp == 60):
		texture_over = preload("res://assets/health bars/health_60.png")
	elif (player.hp == 50):
		texture_over = preload("res://assets/health bars/health_50.png")
	elif (player.hp == 40):
		texture_over = preload("res://assets/health bars/health_40.png")
	elif (player.hp == 30):
		texture_over = preload("res://assets/health bars/health_30.png")
	elif (player.hp == 20):
		texture_over = preload("res://assets/health bars/health_20.png")
	elif (player.hp == 10):
		texture_over = preload("res://assets/health bars/health_10.png")
	elif (player.hp == 0):
		texture_over = preload("res://assets/health bars/health_0.png")
