extends Line2D
@export var col_polygon : CollisionPolygon2D

func _ready() -> void:
	col_polygon.set_polygon(points)
