extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$world/CollisionPolygon2D/Polygon2D.polygon = $world/CollisionPolygon2D.polygon

func _on_interact_mouse_entered():
	print("Hovered")
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$interact.queue_free()  # Delete from world

var dragging = false
var offset = Vector2.ZERO

func _process(delta):
	if dragging:
		$draggable.global_position = get_global_mouse_position() - offset

func _on_button_button_down():
	dragging = true
	offset = get_global_mouse_position() - $draggable.global_position

func _on_button_button_up():
	dragging = false


