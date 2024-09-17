extends Control


func _on_btn_calc_pressed() -> void:
	var copies = int($LineEdit.text)
	var price  = 0.0  # Price per copy
	var tcost  = 0.0  # Total cost
	if copies > 0 and copies <= 99:
		price = 0.30
	elif copies > 99 and copies <= 499:
		price = 0.28
	elif copies > 499 and copies <= 749:
		price = 0.27
	elif copies > 749 and copies <= 1000:
		price = 0.26
	elif copies > 1000:
		price = 0.25
	else:
		$lblOut.text = "Invalid # of copies"
		return
	tcost = price * copies
	$lblOut.text = "Price per copy: $" + str(price) + \
				   "\nTotal cost: $%.2f" % tcost


func _on_btn_clear_pressed() -> void:
	pass # Replace with function body.


func _on_btn_exit_pressed() -> void:
	pass # Replace with function body.
