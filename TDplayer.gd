extends CharacterBody2D


const SPEED = 200.0  # 80.0
# const JUMP_VELOCITY = -400.0
var inertia = Vector2()
var look_direction = Vector2.DOWN  # (0, 1)

var menu_scene = preload("res://my_gui.tscn")
var menu_instance = null

func _ready():
	menu_instance = menu_scene.instantiate()
	get_tree().get_root().add_child.call_deferred(menu_instance)
	menu_instance.hide()

func _physics_process(delta):
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	if direction.length() > 0:
		look_direction = direction
		# Scale to 1 to prevent speed boost from diagonals
		direction = direction.normalized()
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2(), SPEED)
	
	velocity += inertia
	move_and_slide()
	inertia = inertia.move_toward(Vector2(), delta * 1000.0)
	
	if Input.is_action_just_pressed("ui_cancel"):
		menu_instance.show()
		get_tree().paused = true
