extends Control

func _on_btn_calc_pressed() -> void:
	var length = int($txtLen.text)
	var width = int($txtWid.text)
	var area = length * width
	var perim = 2 * length + 2 * width
	$lblArea.text = "Area: " + str(area)
	$lblPerim.text = "Perimeter: " + str(perim)
	# Operators: + - * / %      ** pow
	# str - string (text)
	# int - integer (whole number)
	# float - floating-point number (w/ decimal)

func _on_btn_clear_pressed() -> void:
	$txtLen.text = ""
	$txtWid.text = ""
	$lblArea.text = ""
	$lblPerim.text = ""

func _on_btn_exit_pressed() -> void:
	get_tree().quit()
