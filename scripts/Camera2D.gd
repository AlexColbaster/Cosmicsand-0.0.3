extends Camera2D
var speed = 1

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		position += event.relative*speed
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	if Input.is_action_just_pressed("scrd") and zoom < Vector2(2, 2):
		zoom += Vector2(0.2, 0.2)
	if Input.is_action_just_pressed("scru") and zoom > Vector2(0.5, 0.5):
		zoom -= Vector2(0.2, 0.2)

