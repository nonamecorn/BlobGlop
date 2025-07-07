extends Marker2D

var bullet_obj = preload("res://obj/misc/bullet.tscn")

func _ready() -> void:
	Global.unfreeze.connect(deploy)
var enabled = false
func deploy():
	enabled = true


func _on_timer_timeout() -> void:
	if !enabled: return
	var bullet_inst = bullet_obj.instantiate()
	bullet_inst.global_rotation = global_rotation
	bullet_inst.global_position = global_position
	get_parent().apply_impulse(Vector2.DOWN.rotated(global_rotation) * 300)
	get_tree().current_scene.call_deferred("add_child", bullet_inst)
