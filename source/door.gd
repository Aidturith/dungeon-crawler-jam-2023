extends Node3D

var is_open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_hit_box_input_event(_camera:Node, event:InputEvent, 
									_position:Vector3, _normal:Vector3, _shape_idx:int):
	if event is InputEventMouseButton && event.is_pressed():
		if is_open:
			close()
		else:
			open()
		

func open():
	$"sliding-door/AnimationPlayer".play("open")
	self.is_open = true
	
func close():
	$"sliding-door/AnimationPlayer".play("close")
	self.is_open = false