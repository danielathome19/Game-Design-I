extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$world/CollisionPolygon2D/Polygon2D.polygon = $world/CollisionPolygon2D.polygon


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
