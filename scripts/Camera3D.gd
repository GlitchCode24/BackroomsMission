extends OmniLight3D

var light_remains = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _physics_process(delta):
	var input_vector = Input.get_vector("camera_right", "camera_left", "camera_down", "camera_up").normalized()
	if !input_vector:
		input_vector = Input.get_vector("key_camera_right","key_camera_left","key_camera_up","key_camera_down").normalized() 
	var rotation_y = input_vector.y * 0.04
	rotate_object_local(Vector3(1,0,0), rotation_y)
	transform.basis.z = Vector3(0,0,1)
	if Input.is_action_just_pressed("light") and light_remains:
		if omni_range == 5:
			omni_range = 0
		elif light_remains:
			omni_range = 5
	if Input.is_action_just_pressed("thirdtoggle"):
		$Camera3D.position.z = -0.5

