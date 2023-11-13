extends Control

var highscores = [28, 7, 15]

func update_scoreboard():
	$ItemList.clear()
	highscores.sort()
	# For-each loop
	# for score in highscores:
	# 	$ItemList.add_item(str(score))
	for index in range(len(highscores)):
		$ItemList.add_item("%d. %d" % [index+1, highscores[index]])

func _ready():
	update_scoreboard()

func _on_button_pressed():
	var score = int($LineEdit.text)
	highscores.append(score)
	update_scoreboard()

func _on_button_2_pressed():
	var position = int($LineEdit2.text) - 1
	highscores.remove_at(position)
	update_scoreboard()
	
