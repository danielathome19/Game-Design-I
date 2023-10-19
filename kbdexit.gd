extends Area2D

@export var next_level = ""

func _on_body_entered(body):
	if body.name == "kbdplayer":
		OS.alert("You won!")
		var lvl = "res://" + next_level + ".tscn"
		get_tree().change_scene_to_file(lvl)
