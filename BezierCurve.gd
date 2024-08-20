extends Node2D

var point = preload("res://bezier_point.tscn")

var my_points = []

# Called when the node enters the scene tree for the first time.
func _ready():
	create_tripoint()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func create_tripoint():
	for bpoint in my_points:
		bpoint.queue_free()
	my_points = []
	
	var instance = point.instantiate()
	instance.transform.origin = Vector2(350, 400);
	add_child(instance)
	var ancient_instance = instance
	
	instance = point.instantiate()
	instance.transform.origin = Vector2(600, 200);
	add_child(instance)
	ancient_instance.create_link(instance)
	ancient_instance = instance
	
	instance = point.instantiate()
	instance.transform.origin = Vector2(850, 400);
	add_child(instance)
	ancient_instance.create_link(instance)
	ancient_instance = instance


func create_quadripoint():
	for bpoint in my_points:
		bpoint.queue_free()
	my_points = []
	
	var instance = point.instantiate()
	instance.transform.origin = Vector2(350, 400);
	add_child(instance)
	var ancient_instance = instance
	
	instance = point.instantiate()
	instance.transform.origin = Vector2(500, 200);
	add_child(instance)
	ancient_instance.create_link(instance)
	ancient_instance = instance
	
	instance = point.instantiate()
	instance.transform.origin = Vector2(700, 200);
	add_child(instance)
	ancient_instance.create_link(instance)
	ancient_instance = instance
	
	instance = point.instantiate()
	instance.transform.origin = Vector2(850, 400);
	add_child(instance)
	ancient_instance.create_link(instance)
	ancient_instance = instance
