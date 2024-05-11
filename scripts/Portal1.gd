extends Node3D

var exited = load("res://scenes/Success.tscn").instantiate()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_3d_body_entered(body):
	if body == %Player and get_node("/root/Node3D/Level1/OmniLight3D").light_energy == 1 :
		$CPUParticles3D.emitting = true
		get_node("/root/Node3D/GameMusic").playing = false
		$AudioStreamPlayer3D.play()
		await get_tree().create_timer(0.8).timeout
		get_tree().root.add_child(exited)
		get_node("/root/Node3D").visible = false
		
