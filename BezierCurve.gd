extends Node2D

var point = preload("res://bezier_point.tscn")
var step = preload("res://steps.tscn")
var path = preload("res://bezier_path.tscn")

var my_points = []

var my_steps = []

var my_path = []

var timer = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	create_tripoint()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta / 3.
	if timer > 1.:
		timer = 0.
	
	
	var obj = my_points
	var new_obj = []
	var c = 0
	while obj.size() > 1:
		new_obj = []
		for i in range(obj.size() - 1):
			var new_pos_vector = obj[i + 1].transform.origin - obj[i].transform.origin
			var new_pos = obj[i].transform.origin + new_pos_vector * timer
			my_steps[c].transform.origin = new_pos
			new_obj.append(my_steps[c])
			c += 1
		obj = new_obj
	
	var t = 0.
	for p in range(my_path.size()):
		my_path[p].transform.origin = bezier_position(t)
		t += 0.05
		if p > 0:
			my_path[p - 1].look_at(my_path[p].transform.origin)


func bezier_position(time):
	var obj_pos = []
	for i in my_points:
		obj_pos.append(i.transform.origin)
	var new_obj_pos = []
	while obj_pos.size() > 1:
		new_obj_pos = []
		for i in range(obj_pos.size() - 1):
			var new_pos_vector = obj_pos[i + 1] - obj_pos[i]
			var new_pos = obj_pos[i] + new_pos_vector * time
			new_obj_pos.append(new_pos)
		obj_pos = new_obj_pos
	return obj_pos[0]


func create_tripoint():
	for n in get_children():
		n.queue_free()
	my_points = []
	
	var instance = point.instantiate()
	instance.transform.origin = Vector2(350, 400);
	add_child(instance)
	my_points.append(instance)
	var ancient_instance = instance
	
	instance = point.instantiate()
	instance.transform.origin = Vector2(600, 200);
	add_child(instance)
	my_points.append(instance)
	ancient_instance.create_link(instance)
	ancient_instance = instance
	
	instance = point.instantiate()
	instance.transform.origin = Vector2(850, 400);
	add_child(instance)
	my_points.append(instance)
	ancient_instance.create_link(instance)
	ancient_instance = instance
	
	my_steps = []
	
	for i in range(3):
		var instance_step = step.instantiate()
		add_child(instance_step)
		my_steps.append(instance_step)
	
	my_steps[0].create_link(my_steps[1])
	
	my_path = []
	for i in range(20):
		var instance_path = path.instantiate()
		add_child(instance_path)
		my_path.append(instance_path)


func create_quadripoint():
	for n in get_children():
		n.queue_free()
	my_points = []
	
	var instance = point.instantiate()
	instance.transform.origin = Vector2(350, 400);
	add_child(instance)
	my_points.append(instance)
	var ancient_instance = instance
	
	instance = point.instantiate()
	instance.transform.origin = Vector2(500, 200);
	add_child(instance)
	my_points.append(instance)
	ancient_instance.create_link(instance)
	ancient_instance = instance
	
	instance = point.instantiate()
	instance.transform.origin = Vector2(700, 200);
	add_child(instance)
	my_points.append(instance)
	ancient_instance.create_link(instance)
	ancient_instance = instance
	
	instance = point.instantiate()
	instance.transform.origin = Vector2(850, 400);
	add_child(instance)
	my_points.append(instance)
	ancient_instance.create_link(instance)
	ancient_instance = instance
	
	my_steps = []
	
	for i in range(6):
		var instance_step = step.instantiate()
		add_child(instance_step)
		my_steps.append(instance_step)
	
	my_steps[0].create_link(my_steps[1])
	my_steps[1].create_link(my_steps[2])
	my_steps[3].create_link(my_steps[4])
	
	my_path = []
	for i in range(20):
		var instance_path = path.instantiate()
		add_child(instance_path)
		my_path.append(instance_path)
