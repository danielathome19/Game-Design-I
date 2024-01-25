extends Control


func _on_btn_calc_pressed():
	var length = int($LineEdit.text)
	var width = int($LineEdit2.text)
	var area = length * width
	var perim = 2 * length + 2 * width
	$lblArea.text = "Area: " + str(area)
	$lblPerim.text = "Perimeter: " + str(perim)
	# Operators: + - * /     ** pow
	# str - string (text)
	# int - integer (whole number)
	# float - floating-point number (w/ decimal)

func _on_btn_clear_pressed():
	$LineEdit.text = ""
	$LineEdit2.text = ""
	$lblArea.text = ""
	$lblPerim.text = ""

func _on_btn_exit_pressed():
	get_tree().quit()





