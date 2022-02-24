extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gravity = 10
var velocity = Vector2(0, 0)
var speed = 30
var is_moving_right = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("walk")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_character()
	detect_turn_around()
	
func move_character():
	velocity.x = speed if is_moving_right else -speed
	velocity.y = velocity.y + gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)

func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_right = is_moving_right
		scale.x = -scale.x
func hit():
	$AttackDetector.monitoring = true
	
func end_of_hit():
	$AttackDetector.monitoring = false

func start_walk():
	$AnimatedSprite.play("walk")

func _on_PlayerDetector_body_entered(body):
	$AnimatedSprite.play("attack")


func _on_AttackDetector_body_entered(body):
	pass # Replace with function body.
