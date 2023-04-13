extends Node

# masking
var wall_mask = 0b1
var cell_mask = 0b10
var obstacle_mask = 0b100

# player movements
var player_tween_speed = 0.4
var player_queue_input = true

func set_player_speed(value: float):
    player_tween_speed = value

func get_player_speed():
    return player_tween_speed
    