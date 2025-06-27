extends Node2D




func _on_paddle_area_entered(area: Area2D) -> void:
	print("collision",area)


func _on_gem_game_over() -> void:
	print("Game OVER")
	load("res://Scenes/Paddle/paddle.tscn")
