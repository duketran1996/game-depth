extends KinematicBody2D


var velocity = Vector2()
const SPEED = 200
var Gravity = 20
const MAXFALLSPEED = 1000
var facing_right = true
const bulletPath = preload("res://Asset/Scene/Bullet.tscn")
var is_levitating = false

func _physics_process(delta):
	if facing_right == true:
		$AnimatedSprite.scale.x = 1
	else:
		$AnimatedSprite.scale.x = -1
	
	if is_levitating == true:
		Gravity = 0
		$AnimatedSprite.play("jump")
		if Input.is_action_pressed("up"):
			velocity.y = -SPEED
		elif Input.is_action_pressed("down"):
			velocity.y = SPEED
		else:
			velocity.y =  lerp(velocity.y, 0, 0.2)
		if Input.is_action_pressed("right"):
			facing_right = true
			velocity.x = SPEED
		elif Input.is_action_pressed("left"):
			facing_right = false
			velocity.x = -SPEED
		else:
			velocity.x =  lerp(velocity.x, 0, 0.2)
		
	else:
		$AnimatedSprite.play("idle")
		Gravity = 20
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

	if Input.is_action_just_pressed("jump"):
		is_levitating = not is_levitating
		
	
	# Hit
	if Input.is_action_just_pressed("hit"):
		shoot()
		$AnimatedSprite.play("hit")


	
	# Make velocity implmented on player's movement
	velocity = move_and_slide(velocity, Vector2.UP)
	
func shoot():
	var bullet = bulletPath.instance()
	get_parent().add_child(bullet)
	if facing_right == true:
		bullet.get_node("Sprite").scale.x = 1
		bullet.position = position + Vector2(5, 0)
	else:
		bullet.get_node("Sprite").scale.x = -1
		bullet.position = position + Vector2(-5, 0)
		bullet.velocity = -bullet.velocity
		
