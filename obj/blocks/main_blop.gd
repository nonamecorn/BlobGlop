extends RigidBody2D
class_name MainBlop

signal enabled
signal died

@export var hp : int = 100
@export var player_handeled : bool = false
@export var camera : Camera2D

func enable():
	camera.enabled = true
	enabled.emit()
	Global.unfreeze.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		apply_torque(-30000)
	
	if Input.is_action_pressed("ui_right"):
		apply_torque(30000)

func hurt(damage):
	hp -= damage
	print(hp)
	if hp <= 0:
		died.emit()
		if player_handeled:
			Global.dead.emit()
