extends BaseItem

func _init(): super._init(5)  # 1/4 of a heart

func interact(player):
	player.pickup_health(value)
	remove()
