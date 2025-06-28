extends Node2D

const gem_scene = preload("res://Scenes/Gem/gem.tscn")
@onready var timer: Timer = $Timer
@onready var paddle: Area2D = $Paddle
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var bgm: AudioStreamPlayer = $BGM
@onready var explode: AudioStreamPlayer = $Explode
@onready var score_label: Label = $Label

var file_path = "user://file.save"
var score: int = 0

func _ready() -> void:
	score = read(score)
	txts()
	create_gem()


func _on_paddle_area_entered(_area: Area2D) -> void:
	score += 1
	score_sound.play()
	txts()

func txts():
	var txt = str(score)
	if score < 10:
		txt = "00" + txt
	else: if score < 100:
		txt = "0" + txt
	score_label.text = txt
	save(score)

func save(var_save) -> void:
	var file = FileAccess.open(file_path,FileAccess.WRITE)
	file.store_var(var_save)

func read(var_save) -> int:
	if FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path,FileAccess.READ)
		return file.get_var(var_save)
	else:
		print("no data :(")
		return 1

func stop_all() -> void:
	timer.stop()
	for child in get_children():
		if child is Gem:
			child.set_process(false)
	paddle.set_process(false)
	score_sound.stop()
	bgm.stop()
	explode.play()
	score = 0
	txts()
	save(score)


func create_gem() -> void:
	var new_gem: Gem = gem_scene.instantiate()
	var x = randf_range(0.0,get_viewport_rect().end.x)
	new_gem.position = Vector2(x,-50.0)
	add_child(new_gem)
	new_gem.game_over.connect(_on_gem_game_over)
	print("spawned gem")

func _on_gem_game_over() -> void:
	stop_all()


func _on_timer_timeout() -> void:
	create_gem()
