extends Area2D

@export var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(-get_viewport_rect().end.x)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		position.x -= speed
	if Input.is_action_pressed("move_right"):
		position.x += speed
	position.x = clamp(position.x,0 + 50,get_viewport_rect().end.x - 50)
	print(position.x)
