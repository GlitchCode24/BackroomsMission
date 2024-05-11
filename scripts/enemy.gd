extends CharacterBody3D

var POS
var dir
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$NavigationAgent3D.target_position = %Player.position
	POS = Vector2(position.x,position.z)
	dir = POS.angle_to_point(Vector2($NavigationAgent3D.get_next_path_position().x,$NavigNavigationAgent3D.get_next_path_position.z)) 
	if dir:
		velocity.x = dir.x * delta
		velocity.z = dir.z * delta
