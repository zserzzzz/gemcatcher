extends Area2D

class_name Gem



@export var speed = 100


signal game_over


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func kms() -> void:
	set_process(false)
	queue_free()
	print("kms")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * delta
	
	if position.y > get_viewport_rect().end.y + 40:
		print("offscreen")
		game_over.emit()
		kms()


func _on_area_entered(area: Area2D) -> void:
	print("collided")
	kms()
