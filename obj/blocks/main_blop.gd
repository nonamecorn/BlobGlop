extends RigidBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		apply_torque(-3000)
	
	if Input.is_action_pressed("ui_right"):
		apply_torque(3000)
