extends StaticBody2D

class_name MovableObject

var is_hovered = false
var is_dragged = false

var timer_double_click = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer_double_click > 0:
		timer_double_click -= delta
	
	if is_hovered:
		print("hovered")
	
	if is_dragged:
		print("here")
		transform.origin = get_global_mouse_position()

func _input(event):
	if event.is_action_pressed("left_click") and is_hovered:
		_is_clicked()
		is_dragged = true
		if timer_double_click > 0:
			_is_double_clicked()
		timer_double_click = 0.2
	if event.is_action_released("right_click") and is_hovered:
		_is_right_clicked()

	if event.is_action_released("left_click") and is_dragged:
		_is_released()
		is_dragged = false

func _is_clicked():
	pass # to override
	
func _is_right_clicked():
	pass # to override

func _is_double_clicked():
	pass # to override

func _is_released():
	pass # to override

func _mouse_enter():
	is_hovered = true

func _mouse_exit():
	is_hovered = false
