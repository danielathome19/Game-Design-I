extends Control


func _on_btn_calc_pressed() -> void:
	$ItemList.add_item("Number")
	# range(stop)
	# range(start, stop)
	# range(start, stop, step)
	# The 'stop' number is excluded, so add 1 if needed
	for num in range(2, 36+1, 2):
		var line = str(num)
		$ItemList.add_item(line)


func _on_btn_clear_pressed() -> void:
	$ItemList.clear()
