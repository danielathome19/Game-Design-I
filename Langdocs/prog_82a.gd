extends Control


func _on_btn_calc_pressed() -> void:
	var speedLimit = int($txtLimit.text)
	var carSpeed = int($txtSpeed.text)
	var milesOver = carSpeed - speedLimit
	var fine = 20.0 + (milesOver * 5.0)
	$lblFine.text = "$ %.2f" % fine


func _on_btn_clear_pressed() -> void:
	pass # TODO


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
