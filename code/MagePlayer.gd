extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,1)


func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = 100
	if Input.is_action_pressed("left"):
		velocity.x = -100
	move_and_slide(velocity)
	velocity.x = lerp(velocity.x,  0, 0.2)
