extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

var sp_enemy = preload("res://scenes/enemy.tscn")
var path_enemy_scene = preload("res://scenes/path_enemy.tscn")

@onready var Enemy_spawn_postions = $spawnposition

func _on_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var Spawn_postions_array = Enemy_spawn_postions.get_children()
	var Random_spawn_postion = Spawn_postions_array.pick_random()
	var enemy_instance = sp_enemy.instantiate()
	enemy_instance.global_position = Random_spawn_postion.global_position
	emit_signal("enemy_spawned", enemy_instance)
	
	


func _on_pathtimer_timeout() -> void:
	spawn_path_enemy_()


func spawn_path_enemy_():
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)
