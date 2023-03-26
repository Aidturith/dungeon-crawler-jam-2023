@tool
extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("ready")
	remove_redundant_walls()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func remove_redundant_walls():
	var walls_pos = {}
	for c in $Cells.get_children():
		for w in c.get_node('Walls').get_children():
			var at_this_pos = walls_pos.get(w.global_position, [])
			at_this_pos.append(w)
			walls_pos[w.global_position] = at_this_pos
	for walls in walls_pos.values():
		if walls.size() > 1:
			for w in walls:
				w.queue_free()
