extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gravity = 10
var velocity = Vector2(0, 0)
var speed = 30
var is_moving_right = false
var is_hitting = false
var is_dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("Walk")


func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("dead")
	queue_free()

func _physics_process(delta):
	if is_dead == false:
		velocity.x = speed if is_moving_right else -speed
		velocity.y = velocity.y + gravity
		velocity = move_and_slide(velocity, Vector2.UP)
		if not $RayCast2D.is_colliding() or is_on_wall():
			is_moving_right = !is_moving_right
			scale.x = -scale.x

