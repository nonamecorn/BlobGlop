extends Node2D


@onready var blob = preload("res://obj/blocks/body.tscn")
# Called when the node enters the scene tree for the first time.

var up_next = "res://obj/blocks/mouth.tscn":
	set(value):
		up_next = value
		$blob_name.text = value.erase(0,16)


var blops = [
	"res://obj/blocks/gun.tscn",
	"res://obj/blocks/mouth.tscn",
	"res://obj/blocks/thruster.tscn",
	"res://obj/blocks/turbine.tscn",
	"res://obj/blocks/body.tscn",
	"res://obj/blocks/body.tscn",
]

func _ready() -> void:
	$Timer.timeout.connect(spawn_blob)

func save_blob():
	var node = $main_blop
	var scene = PackedScene.new()
	scene.pack(node)
	ResourceSaver.save(scene,"res://MyBlop.tscn")

func spawn_blob():
	blob = load(up_next)
	var blob_inst : RigidBody2D = blob.instantiate()
	blob_inst.scale = Vector2.ONE * randf_range(0.5,0.8)
	blob_inst.global_position = $blob_spawner.global_position
	add_child(blob_inst)
	blops.shuffle()
	up_next = blops[0]

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scn/arena.tscn")
