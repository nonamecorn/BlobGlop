extends Node2D


@onready var blob = preload("res://obj/blocks/body.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.timeout.connect(spawn_blob)

func spawn_blob():
	var blob_inst : RigidBody2D = blob.instantiate()
	blob_inst.scale = Vector2.ONE * randf_range(0.5,0.8)
	blob_inst.global_position = $blob_spawner.global_position
	add_child(blob_inst)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
