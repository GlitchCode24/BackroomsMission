extends CharacterBody3D

var SPEED = 7.5
const JUMP_VELOCITY = 5
var ragdoll = false
var respawn = transform
var time = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var game_over = preload("res://scenes/game_over.tscn").instantiate()
func kill(monster):
	transform = respawn
	$Death.play()
	get_tree().root.add_child(game_over)
	get_node("/root/GameOver/Label2").text = "Died by " + monster
	get_node("/root/Node3D").visible = false


func _physics_process(delta):
	time +=delta
	var input_vector = Input.get_vector("camera_right","camera_left","camera_down","camera_up").normalized()
	if !input_vector:
		input_vector = Input.get_vector("key_camera_right","key_camera_left","key_camera_down","key_camera_up").normalized() 
	var velocity_x = input_vector.x * 0.04
	rotate_object_local(Vector3(0,1,0), velocity_x )
	
	if Input.is_action_just_pressed("ragdoll"):
		if ragdoll:
			ragdoll = false
		else :
			ragdoll = true
		if ragdoll:
			await get_tree().create_timer(9.95).timeout
			if ragdoll:
				kill("Hide")
				ragdoll = false
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and !ragdoll:
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	print(input_dir)
	if  !input_dir:
		input_dir = Input.get_vector("left","right","front","back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction and !%Player.ragdoll:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	elif !%Player.ragdoll :
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	else:
		velocity.x = 0
		velocity.z = 0

	move_and_slide()



func _on_button_pressed():
	if ragdoll:
		ragdoll = false
	else :
		ragdoll = true
