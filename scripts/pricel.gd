extends Sprite

var timing = 1
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		timing += 1
		if timing % 2 == 0:
			visible = false
		if timing % 2 == 1:
			visible = true
	Singleton.position_pricel = global_position
