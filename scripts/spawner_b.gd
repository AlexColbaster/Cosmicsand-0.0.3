extends Position2D

var b = preload("res://scns/unit_builder.tscn")
func _physics_process(delta):
	if Input.is_action_just_pressed("new_b"):
		if Singleton.cokey > 9:
			spawn()
func spawn():
	var spawnling = b.instance()
	get_parent().add_child(spawnling)
	spawnling.z_index = 20
	Singleton.cokey -= 10

