extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	update_animation(direction)
		
	move_and_slide()


@onready var anim = $AnimatedSprite2D
func update_animation(direction):
	if not self.is_on_floor():  # Jumping
		anim.play("jump")
	elif direction != 0:  # Walking
		anim.play("walk")
		anim.flip_h = direction < 0  # Flip sprite if moving left
	else:  # Idle
		anim.play("default")
