extends CharacterBody3D

var RUN = true
var SPEED = -875



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	get_node("3DGodotRobot/AnimationPlayer").play("Idle")
	if RUN:
		velocity.x = SPEED * delta
	if position.x < -35:
		position.x = 14.6
	move_and_slide()



func on_touch(body):
	if body == %Player and !%Player.ragdoll:
		%Player.kill("Backrooms Guardian") 



func _on_area_3d_2_body_entered(body):
	if body == %Player :
		$"3DGodotRobot/AnimationPlayer".play("Run")
		RUN = true
