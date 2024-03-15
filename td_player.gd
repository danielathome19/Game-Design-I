extends CharacterBody2D

const SPEED = 100.0
const MAXIMUM_OBTAINABLE_HEALTH = 400.0

enum STATES { IDLE=0, DEAD, DAMAGED, ATTACKING, CHARGING }

@export var data = {
	"max_health": 60.0,  # 20hp per heart; 5 per fraction
	"health": 60.0,      # Min 60 Max 400
	"money": 0,
	"state": STATES.IDLE,
	"secondaries": [],
}

var inertia = Vector2()
var look_direction = Vector2.DOWN  # (0, 1)

var menu_scene = preload("res://my_gui.tscn")
var menu_instance = null

@onready var p_HUD = get_tree().get_first_node_in_group("HUD")

func pickup_money(value):
	data.money += value

func pickup_health(value):
	data.health += value
	data.health = clamp(data.health, 0, data.max_health)

func _ready():
	p_HUD.show()
	menu_instance = menu_scene.instantiate()
	$Camera2D.add_child.call_deferred(menu_instance)
	menu_instance.hide()

func _physics_process(delta):
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	update_animation(direction)
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


func update_animation(direction):
	var a_name = "idle_"
	if direction.length() > 0:
		look_direction = direction
		a_name = "walk_"
	if look_direction.x != 0:
		a_name += "side"
		$AnimatedSprite2D.flip_h = look_direction.x < 0
	elif look_direction.y < 0:
		a_name += "up"
	elif look_direction.y > 0:
		a_name += "down"
		
	$AnimatedSprite2D.animation = a_name
	$AnimatedSprite2D.play()















