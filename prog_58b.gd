extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_calc_pressed():
	var A = int($txtA.text)
	var B = int($txtB.text)
	var C = int($txtC.text)
	var proot = (-B + sqrt(B**2 - 4 * A * C)) / 2 * A
	var nroot = (-B - sqrt(B**2 - 4 * A * C)) / 2 * A
	$lblOut.text = "Roots are %d and %d" % [proot, nroot]
