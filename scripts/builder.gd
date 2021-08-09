extends KinematicBody2D
var nothing
const SPEED = 30000
var s = Vector2()
var sit_rand_x = 0
var sit_rand_y = 0
onready var timervel = $Timervel
var timing1 = 2
var freedom = true

func _on_Timervel_timeout():
	timing1 += 1

func _process(delta):
	if timing1 % 2 == 0:
		randomize()
		sit_rand_x = rand_range(-10000, 10000)
		sit_rand_y = rand_range(-10000, 10000)
		if freedom == true:
			s = Vector2(sit_rand_x, sit_rand_y)
#система отсчёта таймера при помощи чётности переменной
func _physics_process(delta):
	if position != s:
		var vel = global_position.direction_to(s)
		look_at(vel)
		vel = move_and_slide(vel*delta*SPEED)
	if Input.is_action_just_pressed("build_generator"):
		spawn_gen()
	if Input.is_action_just_pressed("build_wall"):
		spawn_wall()
	if Input.is_action_just_pressed("build_gun"):
		spawn_gun()

#перемещение строителя по вектору и строительство
var gun = preload("res://scns/Gun.tscn")
var wall = preload("res://scns/Wall.tscn")
var gen = preload("res://scns/Generator.tscn")
var occupied = str("")
var timing2 = false
onready var timerbuild = $Timerbuild

func spawn_gen():
	occupied = str(round(Singleton.position_pricel.x / 50) * 50, round(Singleton.position_pricel.y / 50) * 50)
	if occupied in Singleton.occupied:
		nothing = "nothing"
	elif freedom == true:
		freedom = false
		Singleton.occupied += [occupied]
		s = Singleton.position_pricel
		var spawnling = gen.instance()
		get_parent().get_parent().add_child(spawnling)
		spawnling.z_index = 2
		timerbuild.start()
		spawnling.global_position.x = round(Singleton.position_pricel.x / 50) * 50
		spawnling.global_position.y = round(Singleton.position_pricel.y / 50) * 50

func spawn_wall():
	occupied = str(round(Singleton.position_pricel.x / 50) * 50, round(Singleton.position_pricel.y / 50) * 50)
	if occupied in Singleton.occupied:
		nothing = "nothing"
	elif freedom == true:
		freedom = false
		Singleton.occupied += [occupied]
		s = Singleton.position_pricel
		var spawnling = wall.instance()
		get_parent().get_parent().add_child(spawnling)
		spawnling.z_index = 2
		timerbuild.start()
		spawnling.global_position.x = round(Singleton.position_pricel.x / 50) * 50
		spawnling.global_position.y = round(Singleton.position_pricel.y / 50) * 50

func spawn_gun():
	occupied = str(round(Singleton.position_pricel.x / 50) * 50, round(Singleton.position_pricel.y / 50) * 50)
	if occupied in Singleton.occupied:
		nothing = "nothing"
	elif freedom == true:
		freedom = false
		Singleton.occupied += [occupied]
		s = Singleton.position_pricel
		var spawnling = gun.instance()
		get_parent().get_parent().add_child(spawnling)
		spawnling.z_index = 2
		timerbuild.start()
		spawnling.global_position.x = round(Singleton.position_pricel.x / 50) * 50
		spawnling.global_position.y = round(Singleton.position_pricel.y / 50) * 50


func _on_Timerbuild_timeout():
	freedom = true
