extends Node2D

func _ready() -> void:
	var blob_inst = ResourceLoader.load("res://MyBlop.tscn").instantiate()
	call_deferred("add_and_enable",blob_inst)

func add_and_enable(inst):
	add_child(inst)
	inst.enable()


func _on_north_body_entered(body: Node2D) -> void:
	if body is not MainBlop and body is Blop:
		body.get_owner().global_position.y += 3600.0
		return
	body.global_position.y += 3600.0


func _on_south_body_entered(body: Node2D) -> void:
	if body is not MainBlop:
		body.global_position.y -= 3600.0
		return
	body.global_position.y -= 3600.0


func _on_west_body_entered(body: Node2D) -> void:
	if body is not MainBlop:
		body.global_position.x += 7000.0
		return
	body.global_position.x += 7000.0


func _on_east_body_entered(body: Node2D) -> void:
	if body is not MainBlop:
		body.global_position.x -= 7000.0
		return
	body.global_position.x -= 7000.0
