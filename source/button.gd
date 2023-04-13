extends Node3D

signal toggled

var pushed:bool = false

func _on_area_3d_input_event(_camera:Node, event:InputEvent, _position:Vector3, _normal:Vector3, _shape_idx:int):
	if event is InputEventMouseButton && event.is_pressed():
		toggled.emit()
		if pushed:
			$AnimationPlayer.play("pull")
			self.pushed = false
		else:
			$AnimationPlayer.play("push")
			self.pushed = true
