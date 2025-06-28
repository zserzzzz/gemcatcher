extends Area2D

var left = false
var right = false

@export var speed = 500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var movement = Input.get_axis("move_left","move_right")
	position.x += speed * movement * delta
	
	if right == true:
		position.x += speed * 1 * delta
	elif left == true:
		position.x += speed * -1 * delta
	
	
	position.x = clamp(position.x,0 + 50,get_viewport_rect().end.x - 50)
	#print(position.x)


func _on_lefft_pressed() -> void:
	left = true


func _on_lefft_released() -> void:
	left = false


func _on_right_pressed() -> void:
	right = true


func _on_right_released() -> void:
	right = false
