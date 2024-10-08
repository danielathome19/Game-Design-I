extends Control

var score = 0  # Global variable

func addPoint(): score += 1
func subPoint(): score -= 1
func reset():    score  = 0

func update():
	$lblOut.text = "Score: %d" % score  # "Score: " + str(score)

func _on_btn_update_pressed() -> void:
	var choice = $LineEdit.text.to_lower()
	if choice == "add":
		addPoint()
	elif choice == "sub" or choice == "subtract":  # elif "sub" in choice
		subPoint()
	else:
		OS.alert("Invalid choice!")  # Capital O and S
	update()

func _on_btn_reset_pressed() -> void:
	reset()
	update()
