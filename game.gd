extends Node2D

var lives = 3
var score = 0

@onready var player = $player
@onready var hud = $UI/HUD
@onready var ui = $UI
@onready var enemy_hit_sound = $enemyhitsound
@onready var explodesound = $Explodesound

var gos_screen = preload("res://scenes/gameoverscreen.tscn")

func _ready():
	hud.set_score_label(score)
	hud.set_lives(lives)

func _on_deathzone_area_entered(area):
	area.queue_free()


func _on_player_took_damage():
	explodesound.play()
	lives -= 1
	hud.set_lives(lives)
	if (lives == 0):
		print("game over")
		player.die()
		
		
		await get_tree().create_timer(1.5).timeout
		
		var gos = gos_screen.instantiate()
		gos.set_score(score)
		ui.add_child(gos)


func _on_enemyspawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)
	
	
func _on_enemy_died():
	score += 100
	hud.set_score_label(score)
	enemy_hit_sound.play()


func _on_enemyspawner_path_enemy_spawned(path_enemy_instance):
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", _on_enemy_died)
