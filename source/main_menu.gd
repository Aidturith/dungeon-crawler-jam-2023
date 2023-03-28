extends Control

# @onready var speed_label_n = $Options/VBoxContainer/HBoxContainer/MoveSpeedLabel
# @onready var speed_slider_n = $Options/VBoxContainer/HBoxContainer/MoveSpeedSlider


func _ready():
	pause()


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		pause()


func pause():
	get_tree().paused = true
	self.show()
	
func resume():
	get_tree().paused = false
	self.hide()


func _on_start_pressed():
	$Pause/VBoxContainer/Buttons/Start.hide()
	$Pause/VBoxContainer/Buttons/Resume.show()
	$Pause/VBoxContainer/Buttons/Exit.hide()
	$Pause/VBoxContainer/Buttons/Return.show()
	resume()


func _on_resume_pressed():
	resume()


func _on_return_pressed():
	$Pause/VBoxContainer/Buttons/Start.show()
	$Pause/VBoxContainer/Buttons/Resume.hide()
	$Pause/VBoxContainer/Buttons/Exit.show()
	$Pause/VBoxContainer/Buttons/Return.hide()


func _on_exit_pressed():
	get_tree().quit()


func _on_options_pressed():
	$Pause.hide()
	$Options.show()


func _on_move_speed_slider_value_changed(value:float):
	Global.set_player_speed(value)
	$Options/VBoxContainer/HBoxContainer/MoveSpeedLabel.text = 'Move Speed %.1fs' % [value]


func _on_move_speed_slider_ready():
	$Options/VBoxContainer/HBoxContainer/MoveSpeedSlider.value = Global.get_player_speed()
	

func _on_back_pressed():
	$Pause.show()
	$Options.hide()
