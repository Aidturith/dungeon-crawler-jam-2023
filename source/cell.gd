extends Area3D

var sound_weights = {}


func _ready():
	sound_weights[$Sounds/Droplet] = 1./12000
	sound_weights[$Sounds/Rats] = 1./25000


func _process(_delta):
	process_sounds()


func process_sounds():
	# TODO have a global approach 
	# and check if there no duplicate play ?
	for sound in sound_weights:
		if randf() < sound_weights[sound]:
			sound.play()
