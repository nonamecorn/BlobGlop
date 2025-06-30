extends RigidBody2D

var connected : bool = false

func _on_body_entered(body: Node) -> void:
	if !body.is_in_group("attachable") or $PinJoint2D.node_a != NodePath(""): return
	gravity_scale = 0.0
	#var coll_vec = global_position - body.global_position
	#$PinJoint2D.global_position = global_position + coll_vec / 2
	connected = true
	$PinJoint2D.set_node_a(body.get_path())

#func _physics_process(delta: float) -> void:
	#if connected:
		#apply_force(Vector2.RIGHT.rotated(global_rotation) * 3000)
