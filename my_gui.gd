extends Control

# TODO: set panel to anchor, full rect
# then, move buttons into Vbox and anchor to center

func _ready():
	self.process_mode = Node.PROCESS_MODE_ALWAYS

func _on_quit_pressed():
	get_tree().quit()

func _on_resume_pressed():
	hide()
	get_tree().paused = false
