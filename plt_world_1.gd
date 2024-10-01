extends Node2D

func _ready() -> void:
	$world/CollisionPolygon2D/Polygon2D.polygon = \
		$world/CollisionPolygon2D.polygon
	pass
