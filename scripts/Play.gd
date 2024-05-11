extends Button

var simultaneous_scene = preload("res://scenes/level.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_text_submit" ):
		_on_pressed()


func _on_pressed():
	get_tree().root.add_child(simultaneous_scene)
	get_node("/root/Menu").visible = false
	
	
