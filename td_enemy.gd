extends CharacterBody2D

const SPEED = 60.0
var MAX_HEALTH = 30.0
var HEALTH = MAX_HEALTH
var DAMAGE = 10.0
var AI_STATE = STATES.IDLE

enum STATES { IDLE=0, UP, DOWN, LEFT, RIGHT,
			  UP_L, UP_R, DOWN_L, DOWN_R, DAMAGED }

var state_directions = [
	Vector2.ZERO,
	Vector2.UP,
	Vector2.DOWN,
	Vector2.LEFT,
	Vector2.RIGHT,
	Vector2(-1, -1).normalized(),  # UL
	Vector2(1, -1).normalized(),   # UR
	Vector2(-1, 1).normalized(),   # DL
	Vector2(1, 1).normalized(),    # DR
	Vector2.ZERO,
]

var state_animations = [
	"",
	"e_walk_up",
	"e_walk_down",
	"e_walk_left",
	"e_walk_right",
	"e_walk_left",
	"e_walk_right",
	"e_walk_left",
	"e_walk_right",
	"",
]

var inertia = Vector2()
var ai_timer_max = 0.5
var ai_timer = ai_timer_max - randi() % 5
var damage_lock = 0.0
var animation_lock = 0.0
var knockback = 128.0
var vision_distance = 50.0
var money_value = 5.0

signal recovered

@onready var raycastR = $RayCast2DR
@onready var raycastM = $RayCast2DM
@onready var raycastL = $RayCast2DL

@onready var anim_player = $AnimatedSprite2D

func turn_toward_player_location(location: Vector2):
	# TODO:
	pass

func take_damage(dmg, attacker=null):
	# TODO:
	pass

func _physics_process(delta):
	animation_lock = max(animation_lock - delta, 0.0)
	damage_lock = max(damage_lock - delta, 0.0)
	if int(AI_STATE) >= 1 and int(AI_STATE) <= 8:
		var raydir = state_directions[int(AI_STATE)]
		raycastM.target_position = raydir * vision_distance
		raycastL.target_position = \
			raydir.rotated(deg_to_rad(-45)).normalized() * vision_distance
		raycastR.target_position = \
			raydir.rotated(deg_to_rad(45)).normalized() * vision_distance
	if animation_lock == 0.0:
		# TODO: recover from damage
		# TODO: damage player
		
		ai_timer = clamp(ai_timer - delta, 0.0, ai_timer_max)
		if ai_timer == 0.0:
			if AI_STATE == STATES.IDLE:
				var rnd_move = randi() % 4
				AI_STATE = STATES.values()[rnd_move+1]
			else:
				AI_STATE = STATES.IDLE
			ai_timer = ai_timer_max
		
		var direction = state_directions[int(AI_STATE)]
		velocity = direction * SPEED
		
		var anim = state_animations[int(AI_STATE)]
		if anim and not anim_player.is_playing():
			anim_player.play(anim)
		if AI_STATE == STATES.IDLE and anim_player.is_playing():
			anim_player.stop()
		
		velocity += inertia
		move_and_slide()
		inertia = inertia.move_toward(Vector2(), delta * 1000.0)
	pass










