extends BaseItem

func _init():  super._init(5)
func _ready(): super._ready()

func interact(player):
	player.pickup_health(value)
	remove()
