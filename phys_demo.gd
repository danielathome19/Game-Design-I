extends Node2D

func _ready():
	$Panel/GravSlider.value = $phys_ball.gravity_scale

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var nball = preload("res://phys_ball.tscn").instantiate()
		nball.position = event.position
		add_child(nball)

func _on_grav_slider_value_changed(value):
	for child in get_children():
		if child is RigidBody2D:
			child.gravity_scale = value

func _on_button_pressed():
	for child in get_children():
		if child is RigidBody2D:
			var force = randi_range(50, 1000)
			child.apply_central_impulse(Vector2(1,0) * force)  # Vector2.RIGHT
