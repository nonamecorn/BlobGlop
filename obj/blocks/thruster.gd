extends Blop

func _physics_process(delta: float) -> void:
	if deployed:
		apply_force(Vector2.DOWN.rotated(global_rotation) * 300)
