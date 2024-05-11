extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in Input.get_connected_joypads():
		Input.start_joy_vibration(i,1,0.5,0.75)
	if Input.is_action_just_pressed("ui_text_submit"):
		if OS.has_feature("standalone"):
			OS.create_process(OS.get_executable_path(), [])
		get_tree().quit(0)
	if Input.is_action_just_pressed("ragdoll"):
		get_tree().quit(0)
