extends MovableObject

var next_point = null

var link = null

var connection = preload("res://link.tscn")


func _process(delta):
	super._process(delta)
	if link != null and next_point != null:
		link.transform.origin = transform.origin + (next_point.transform.origin - transform.origin)/2
		link.look_at(next_point.transform.origin)
		link.scale.x = 0.2 * (next_point.transform.origin - transform.origin).length() * 0.04
		link.scale.y = 0.1


func create_link(connected_to):
	next_point = connected_to
	var instance = connection.instantiate()
	link = instance
	get_parent().add_child(instance)
	
