extends MeshInstance3D

var fixed
# Called when the node enters the scene tree for the first time.
func _ready():
	fixed == false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body(body):
	if body == %Player:
		get_node("/root/Node3D/Level1/OmniLight3D").light_energy = 1
		$MeshInstance3D/OmniLight3D.light_color = Color(1,1,1)
		$MeshInstance3D.material_override.albedo_color = Color(1,1,1)
		fixed == true
