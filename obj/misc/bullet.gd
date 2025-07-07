extends RigidBody2D

@export var damage : int = 20

func _ready() -> void:
	apply_impulse(Vector2.UP.rotated(global_rotation) * 1000)

func _on_body_entered(body: Node) -> void:
	var blob = body
	if body is not MainBlop and blob is Blop:
		blob = body.get_owner()
	if blob.has_method("hurt"):
		blob.hurt(damage)


func _on_timer_timeout() -> void:
	queue_free()
