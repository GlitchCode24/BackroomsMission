extends Node3D
var player = $AnimationPlayer
var emoting = false
# Called when the node enters the scene tree for the first time.
func _ready():
	player.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var input_vector =Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if !input_vector:
		input_vector = Input.get_vector("left","right","front","back")
	if input_vector != Vector2(0,0) and !%Player.ragdoll and !emoting:
		player.play("Run")
	elif !emoting :
		player.play("Idle")
	if !%Player.is_on_floor() and %Player.velocity.y > 0 and !emoting:
		player.play("Jump")
	elif !%Player.is_on_floor() and %Player.velocity.y < 0 and !emoting:
		player.play("Fall")
	if %Player.ragdoll and !emoting:
		player.play("Crouch")
	if Input.is_action_just_pressed("emote"):
		%Player.ragdoll = true
		player.play("Emote2")
		emoting = true
		await get_tree().create_timer(2.5).timeout
		emoting = false
		%Player.ragdoll = false
	
