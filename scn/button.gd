extends Button

func _ready() -> void:
	Global.dead.connect(show)

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scn/blob_builder.tscn")
