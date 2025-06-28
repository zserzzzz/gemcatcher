extends Area2D

@export var speed = 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement = Input.get_axis("move_left","move_right")
	position.x += speed * movement * delta
	
	position.x = clamp(position.x,0 + 50,get_viewport_rect().end.x - 50)
	#print(position.x)
