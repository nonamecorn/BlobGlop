extends RigidBody2D

class_name Blop

var connected : bool = false

@export var deployed : bool = false

func _ready() -> void:
	Global.unfreeze.connect(deploy)
	if is_instance_valid(owner):
		owner.died.connect(detach)

func _on_body_entered(body: Node) -> void:
	if !body.is_in_group("attachable") or $PinJoint2D.node_a != NodePath(""): return
	gravity_scale = 0.0
	#var coll_vec = global_position - body.global_position
	#$PinJoint2D.global_position = global_position + coll_vec / 2
	body_entered.disconnect(_on_body_entered)
	connected = true
	call_deferred("attach", body)

func detach():
	deployed = false
	$PinJoint2D.call_deferred("set_node_a", "")

func attach(body):
	if !is_instance_valid(body): return
	var main_blop = body
	if body is not MainBlop:
		main_blop = body.get_owner()
	reparent(body)
	set_owner(main_blop)
	main_blop.enabled.connect(deploy)
	$PinJoint2D.set_node_a(body.get_path())

func deploy():
	deployed = true
	set_deferred("contact_monitor", false)
	call_deferred("attach", get_owner())
