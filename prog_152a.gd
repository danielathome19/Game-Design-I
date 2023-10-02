extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_calc_pressed():
	var Sum = 0
	var lcv = 3  # Loop Control Variable
	while lcv <= 9669:  # run code WHILE condition is true
		Sum += lcv
		$ItemList.add_item(str(Sum))
		lcv += 3
	# for lcv in range(3, 9670, 3):
	#   Sum += lcv, add to item list
