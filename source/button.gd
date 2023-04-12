extends Node3D

signal toggled

func _on_area_3d_input_event(_camera:Node, event:InputEvent, _position:Vector3, _normal:Vector3, _shape_idx:int):
	if event is InputEventMouseButton && event.is_pressed():
		toggled.emit()
