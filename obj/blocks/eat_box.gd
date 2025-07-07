extends Area2D

@export var asprite : AnimatedSprite2D
@export var damage : int = 10

func _ready() -> void:
	Global.unfreeze.connect(deploy)
var enabled = false
func deploy():
	enabled = true


func _on_body_entered(body: Node2D) -> void:
	if !enabled: return
	asprite.play()
	$Timer.start()

func _on_body_exited(_body: Node2D) -> void:
	if !enabled: return
	if get_overlapping_bodies().size() == 0:
		asprite.stop()
		$Timer.stop()

func _on_timer_timeout() -> void:
	if !enabled: return
	for body in get_overlapping_bodies():
		if body is not Blop: return
		var blob = body
		if blob is not MainBlop:
			blob = body.get_owner()
		blob.hurt(damage)
		if get_parent().get_owner().player_handeled:
			Global.xp += damage
