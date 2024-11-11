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
	"walk_up",
	"walk_down",
	"walk_left",
	"walk_right",
	"walk_left",   # UL
	"walk_right",  # UR
	"walk_left",   # DL
	"walk_right",  # DR
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

@onready var rcR = $RayCast2DR
@onready var rcM = $RayCast2DM
@onready var rcL = $RayCast2DL
@onready var anim_player = $AnimatedSprite2D

func turn_toward_player_location(location: Vector2):
	# TODO
	pass

func take_damage(dmg, attacker=null):
	# TODO
	if damage_lock == 0.0:
		#AI_STATE = STATES.DAMAGED
		HEALTH -= dmg
		damage_lock = 0.2
		animation_lock = 0.2
		# TODO: damage shader
		if HEALTH <= 0:
			# TODO: drop item
			# TODO: play death sound
			queue_free()
		else:
			if attacker != null:
				#await recovered
				turn_toward_player_location(attacker.global_position)
	pass

func _physics_process(delta: float) -> void:
	animation_lock = max(animation_lock - delta, 0.0)
	damage_lock = max(damage_lock - delta, 0.0)
	if int(AI_STATE) >= 1 and int(AI_STATE) <= 8:
		var raydir = state_directions[int(AI_STATE)]
		rcM.target_position = raydir * vision_distance
		rcL.target_position = \
			raydir.rotated(deg_to_rad(-45)).normalized() * vision_distance
		rcR.target_position = \
			raydir.rotated(deg_to_rad(+45)).normalized() * vision_distance
	if animation_lock == 0.0:
		# TODO: recover from damage
		# TODO: damage player
		
		ai_timer = clamp(ai_timer-delta, 0.0, ai_timer_max)
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
