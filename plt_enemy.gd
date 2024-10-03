extends RigidBody2D

var speed = 100
var direction = -1

func _ready() -> void:
	$Timer.start()

func _physics_process(delta: float) -> void:
	self.linear_velocity.x = speed * direction

func _on_timer_timeout() -> void:
	direction *= -1

func _on_body_entered(body: Node) -> void:
	if body.name == "plt_player":
		body.queue_free()
		OS.alert("You died!")
		get_tree().reload_current_scene()
