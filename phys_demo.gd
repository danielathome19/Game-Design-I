extends Node2D

func _ready():
	$Panel/GravSlider.value = $phys_ball.gravity_scale

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var nball = preload("res://phys_ball.tscn").instantiate()
		nball.position = event.position
		nball.gravity_scale = $Panel/GravSlider.value
		nball.inertia = float($Panel/txtInertia.text)
		nball.linear_velocity = Vector2(float($Panel/txtVelX.text), 
										float($Panel/txtVelY.text))
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

func _on_button_2_pressed():
	var v_inertia = float($Panel/txtInertia.text)
	var v_x = float($Panel/txtVelX.text)
	var v_y = float($Panel/txtVelY.text)
	var velocity = Vector2(v_x, v_y)
	for child in get_children():
		if child is RigidBody2D:
			child.inertia = v_inertia
			child.linear_velocity = velocity
	
