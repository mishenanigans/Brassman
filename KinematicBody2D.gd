extends KinematicBody2D

const UP =Vector2(0,-1)
const Gravity=9.8
const Jump=-550
const Acceleration=50
const MaxSpeed=200
var motion=Vector2()
var friction=false

func _physics_process(delta):
	motion.y+=Gravity
	if Input.is_action_pressed("ui_right"):
		motion.x=min(motion.x+Acceleration,MaxSpeed)
	elif Input.is_action_pressed("ui_left"):
		motion.x=max(motion.x-Acceleration,-MaxSpeed)
	else:
		friction=true
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y=Jump
		if friction==true:
			motion.x=lerp(motion.x,0,0.2)
	else:
		if friction==false:
			motion.x=lerp(motion.x,0,0.05)
	motion=move_and_slide(motion,UP)