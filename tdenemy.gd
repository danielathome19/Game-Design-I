extends CharacterBody2D


const SPEED = 300.0
var MAX_HEALTH: float = 30.0
var HEALTH = MAX_HEALTH
var DAMAGE = 10.0
var AI_STATE = STATES.IDLE

enum STATES { IDLE=0, DAMAGED, UP, DOWN, LEFT, RIGHT,
			  UP_L, UP_R, DOWN_L, DOWN_R }
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
	Vector2.ZERO
]




