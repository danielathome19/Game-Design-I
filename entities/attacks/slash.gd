extends Area2D

var damage    = 10
var knockback = 128.0
var anim_life = 0.2

func _process(delta: float) -> void:
	anim_life -= delta
	if anim_life <= 0:
		queue_free()
		return
	
	for enemy in get_tree().get_nodes_in_group("Enemy"):
		if self.overlaps_body(enemy):
			enemy.take_damage(damage, self)
			var dist = (enemy.global_position-self.global_position)
			enemy.inertia = dist.normalized() * knockback
	pass
