extends Button

@export var quadripoint : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _pressed():
	if !quadripoint:
		get_parent().get_node("BezierCurve").create_tripoint()
	else:
		get_parent().get_node("BezierCurve").create_quadripoint()
