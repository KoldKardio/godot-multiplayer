extends Node2D

const PLAYER = preload("res://player/player.tscn")
const ENEMY = preload("res://enemy/enemy.tscn")

var enemy_count = 0
var max_enemies = 5

onready var players = $Players
onready var enemies = $Enemies

remote func spawn_players(id):
	var player = PLAYER.instance()
	player.name = str(id)
	players.add_child(player)
	rpc("spawn_player", id)
	
remote func spawn_enemies():
	var enemy_instance = ENEMY.instance()
	var idx = randi() % 4
	enemy_instance.name = str(enemy_count)
	
	if enemy_count < max_enemies:
		enemy_count += 1
		enemies.add_child(enemy_instance)
		rpc("spawn_enemy", idx, enemy_instance.name)
		
	
