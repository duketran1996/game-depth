extends KinematicBody2D


var velocity = Vector2()
const SPEED = 200
const Gravity = 20
const MAXFALLSPEED = 1000
const JUMPFORCE = 1000
var facing_right = true

func _physics_process(delta):
	if facing_right == true:
		$AnimatedSprite.scale.x = 1
	else:
		$AnimatedSprite.scale.x = -1
	
	# Gravity part
	velocity.y = velocity.y + Gravity
	if velocity.y > MAXFALLSPEED:
		velocity.y = MAXFALLSPEED
	#Left and Right Movemwnt
	if Input.is_action_pressed("right"):
		facing_right = true
		velocity.x = SPEED
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("left"):
		facing_right = false
		velocity.x = -SPEED
		$AnimatedSprite.play("run")
	else:
		# Implement resistance force an player's movement. (So not move ifinitely)
		velocity.x =  lerp(velocity.x, 0, 0.2)
		$AnimatedSprite.play("idle")
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			velocity.y = - JUMPFORCE
		
	# Make velocity implmented on player's movement
	velocity = move_and_slide(velocity, Vector2.UP)
	


