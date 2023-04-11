extends CharacterBody3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var queued_input = null
var moving = false  # will need a state machine ?


func _ready():
	pass


func _physics_process(_delta):

	if not moving:
		if Input.is_action_pressed("ui_up"):
			move_forth()
		if Input.is_action_pressed("ui_down"):
			move_back()
		if Input.is_action_pressed("ui_left"):
			move_left()
		if Input.is_action_pressed("ui_right"):
			move_right()
	elif Global.player_queue_input:
		if Input.is_action_just_pressed("ui_up"):
			queued_input = "ui_up"
		if Input.is_action_just_pressed("ui_down"):
			queued_input = "ui_down"
		if Input.is_action_just_pressed("ui_left"):
			queued_input = "ui_left"
		if Input.is_action_just_pressed("ui_right"):
			queued_input = "ui_right"
	

	# if not is_on_floor():
	# 	velocity.y -= gravity * delta

	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	# 	velocity.y = JUMP_VELOCITY

	# var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	# var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	# if direction:
	# 	velocity.x = direction.x * SPEED
	# 	velocity.z = direction.z * SPEED
	# else:
	# 	velocity.x = move_toward(velocity.x, 0, SPEED)
	# 	velocity.z = move_toward(velocity.z, 0, SPEED)

	# move_and_slide()

func get_cell(mark: Marker3D):
	var space_state = get_world_3d().direct_space_state
	var from = self.global_position
	var to = mark.global_position
	var query = PhysicsRayQueryParameters3D.create(from, to)
	query.collide_with_bodies = false
	query.collide_with_areas = true
	query.collision_mask = Global.cell_mask
	var result = space_state.intersect_ray(query)
	return result.get('collider', null)

func move_forth():
	var cell = get_cell($FrontMark)
	if cell && cell.name.begins_with('Cell'):
		moving = true
		var move_to = cell.get_node('CellShape').global_position
		tween_toward(move_to)

func move_back():
	var cell = get_cell($BackMark)
	if cell:
		moving = true
		var move_to = cell.get_node('CellShape').global_position
		tween_toward(move_to)

func tween_toward(position_: Vector3):
	$Camera/AnimationPlayer.play("head-bob")
	var tween = create_tween()
	var speed = Global.get_player_speed()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "position", position_, speed)
	tween.tween_callback(_stop_moving)

func move_left():
	moving = true
	tween_turn(PI/2)

func move_right():
	moving = true
	tween_turn(-PI/2)

func tween_turn(radients: float):
	$Camera/AnimationPlayer.play("head-bob")
	var axis = Vector3(0, 1, 0)
	var new_transform = transform
	new_transform.basis = transform.basis.rotated(axis, radients)
	var tween = create_tween()
	var speed = Global.get_player_speed()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "transform", new_transform, speed)
	tween.tween_callback(_stop_moving)

func _stop_moving():
	self.moving = false
	self.transform = self.transform.orthonormalized()
	$Camera/AnimationPlayer.stop(true)
	if queued_input == "ui_up":
		move_forth()
	if queued_input == "ui_down":
		move_back()
	if queued_input == "ui_left":
		move_left()
	if queued_input == "ui_right":
		move_right()
	queued_input = null
	
