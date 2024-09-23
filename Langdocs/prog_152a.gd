extends Control

func _on_btn_calc_pressed() -> void:
	var mySum = 0
	var lcv = 3  # Loop Control Variable
	while lcv <= 9669:  # run code WHILE condition is true
		mySum += lcv
		$ItemList.add_item(str(mySum))
		lcv += 3  # lcv = lcv + 3
	# for lcv in range(3, 9670, 3):
