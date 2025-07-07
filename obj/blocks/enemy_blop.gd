extends MainBlop

@export var turn_speed : float = 30000.0

var target

func enable():
	enabled.emit()
	Global.unfreeze.emit()

func _physics_process(_delta: float) -> void:
	if player_handeled:
		if Input.is_action_pressed("ui_left"):
			apply_torque(-30000)
		if Input.is_action_pressed("ui_right"):
			apply_torque(30000)
		return
	if !is_instance_valid(target): return
	face_point(target.global_position)

func face_point(point: Vector2):
	var l_point = to_local(point)
	var turn_dir = sign(l_point.x)
	var turn_amnt = turn_speed
	#var angle = Vector2.UP.angle_to(l_point)
#	if angle < turn_amnt:
#		turn_amnt = angle
	apply_torque(turn_amnt * turn_dir)


func _on_vision_body_entered(body: Node2D) -> void:
	if body is MainBlop and body != self:
		target = body
