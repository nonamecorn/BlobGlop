extends Blop

var in_cooldown = false

func _on_button_pressed() -> void:
	if !deployed or in_cooldown: return
	$Timer.start()
	$AnimatedSprite2D.play()
	$Button.text = "wait a little"

func _physics_process(_delta: float) -> void:
	if !deployed or $Timer.is_stopped(): return
	apply_force(Vector2.DOWN.rotated(global_rotation) * 900)


func _on_timer_timeout() -> void:
	if !deployed: return
	$AnimatedSprite2D.stop()
	$Cooldown.start()
	in_cooldown = true


func _on_cooldown_timeout() -> void:
	if !deployed: return
	$Button.text = "press me"
	in_cooldown = false
