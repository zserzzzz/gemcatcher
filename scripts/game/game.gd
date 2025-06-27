extends Node2D

const gem_scene = preload("res://Scenes/Gem/gem.tscn")
@onready var timer: Timer = $Timer



func _ready() -> void:
	create_gem()

func _on_paddle_area_entered(area: Area2D) -> void:
	print("collision",area)

func stop_all() -> void:
	timer.stop()
	timer.autostart = false


func create_gem() -> void:
	var new_gem = gem_scene.instantiate()
	var x = randf_range(0.0,get_viewport_rect().end.x)
	new_gem.position = Vector2(x,-50.0)
	add_child(new_gem)
	new_gem.game_over.connect(_on_gem_game_over)

func _on_gem_game_over() -> void:
	print("Game OVER")


func _on_timer_timeout() -> void:
	print("timout")
	create_gem()
