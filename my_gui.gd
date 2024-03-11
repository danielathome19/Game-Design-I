extends Control


func _ready():
	self.process_mode = Node.PROCESS_MODE_ALWAYS
	
func _on_resume_pressed():
	hide()
	get_tree().paused = false
	
func _on_quit_pressed():
	get_tree().quit()
