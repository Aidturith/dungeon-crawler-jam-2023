extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	# print("ready", self.get_overlapping_areas(), self.get_overlapping_bodies())
	# self.area_entered.emit()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# print("process", self.get_overlapping_areas(), self.get_overlapping_bodies())
	pass


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	# working code here
	#print(area)
	#area.queue_free()
	pass
