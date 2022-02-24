extends KinematicBody2D


var velocity = Vector2()
const SPEED = 200
var Gravity = 20
const MAXFALLSPEED = 1000
var facing_right = true
const bulletPath = preload("res://Asset/Scene/Bullet.tscn")
var is_levitating = false
var is_hitting = false

onready var health_bar = get_node("/root/World1/CanvasLayer/Health")
onready var mana = get_node("/root/World1/CanvasLayer/Mana")

func _physics_process(delta):
	if facing_right == true:
		$AnimatedSprite.scale.x = 1
	else:
		$AnimatedSprite.scale.x = -1
	
	if is_levitating == true and mana.value != 0:
		Gravity = 0
		
		if not mana.value == 0:
			mana.value -= 0.1
		
		if is_hitting == false:
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
		Gravity = 20
		# Gravity part
		velocity.y = velocity.y + Gravity
		if velocity.y > MAXFALLSPEED:
			velocity.y = MAXFALLSPEED
		#Left and Right Movemwnt
		if Input.is_action_pressed("right") and is_hitting == false:
			facing_right = true
			velocity.x = SPEED
			$AnimatedSprite.play("run")
		elif Input.is_action_pressed("left") and is_hitting == false:
			facing_right = false
			velocity.x = -SPEED
			$AnimatedSprite.play("run")
		elif is_hitting == false:
			# Implement resistance force an player's movement. (So not move ifinitely)
			velocity.x =  lerp(velocity.x, 0, 0.2)
			$AnimatedSprite.play("idle")

	if Input.is_action_just_pressed("jump"):
		is_levitating = not is_levitating
		
	
	# Hit
	if Input.is_action_just_pressed("hit"):
		shoot()
		$AnimatedSprite.play("hit")
		is_hitting = true

	if Input.is_action_just_pressed("Ultimate"):
		mana.value = 100;
	
	# Make velocity implmented on player's movement
	velocity = move_and_slide(velocity, Vector2.UP)
	
func shoot():
	var bullet = bulletPath.instance()
	mana.value -= 0.4
	
	if facing_right == true:
		bullet.get_node("AnimatedSprite").scale.x = 1
		bullet.position = position + Vector2(50, 0)
		get_parent().add_child(bullet)
	else:
		bullet.get_node("AnimatedSprite").scale.x = -1
		bullet.position = position + Vector2(-50, 0)
		bullet.velocity = -bullet.velocity
		get_parent().add_child(bullet)
		
func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "hit":
		is_hitting = false
