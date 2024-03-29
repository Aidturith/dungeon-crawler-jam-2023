extends Node3D

# TODO have many sources
@export var source: Node3D

var is_open = false

func _ready():
	if source:
		source.toggled.connect(_on_source_toggle)

func _on_source_toggle():
	if is_open:
		close()
	else:
		open()

func open():
	# TODO randomize pitch sound
	# TODO have a nice blend in between animations
	$AnimationPlayer.pause()
	$AnimationPlayer.play("open")
	self.is_open = true
	
func close():
	$AnimationPlayer.pause()
	# $AnimationPlayer.play_backwards("open")
	$AnimationPlayer.play("close")
	self.is_open = false
