extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_hit_box_input_event(camera:Node, event:InputEvent, position:Vector3, normal:Vector3, shape_idx:int):
	print(camera)
	print(event)
	print(position)
	print(normal)
	print(shape_idx)
