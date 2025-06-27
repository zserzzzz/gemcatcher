extends Node2D

const gem_scene = preload("res://Scenes/Gem/gem.tscn")
@onready var timer: Timer = $Timer
@onready var paddle: Area2D = $Paddle
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var bgm: AudioStreamPlayer = $BGM
@onready var explode: AudioStreamPlayer = $Explode



func _ready() -> void:
	create_gem()

func _on_paddle_area_entered(area: Area2D) -> void:
	print("collision",area)
	score_sound.play(0)

func stop_all() -> void:
	timer.stop()
	for child in get_children():
		if child is Gem:
			child.set_process(false)
	paddle.set_process(false)
	score_sound.stop()
	bgm.stop()
	explode.play()


func create_gem() -> void:
	var new_gem: Gem = gem_scene.instantiate()
	var x = randf_range(0.0,get_viewport_rect().end.x)
	new_gem.position = Vector2(x,-50.0)
	add_child(new_gem)
	new_gem.game_over.connect(_on_gem_game_over)

func _on_gem_game_over() -> void:
	stop_all()


func _on_timer_timeout() -> void:
	print("timout")
	create_gem()
