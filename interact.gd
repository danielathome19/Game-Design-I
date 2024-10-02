extends RigidBody2D


func _on_mouse_entered() -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		self.queue_free()  # Delete self from world
