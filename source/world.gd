@tool
extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	# var env = get_tree().root.world.fallback_environment
	# env.background_mode = Environment.BG_COLOR
	# env.background_color = Color.BLACK
	# env.ambient_light_color = Color("432d6d")
	# env.dof_blur_far_enabled = true
	# env.dof_blur_near_enabled = true
	remove_redundant_walls()


func _process(_delta):
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
