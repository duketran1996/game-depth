extends KinematicBody2D


var velocity = Vector2()
const SPEED = 200
const Gravity = 30
const MAXFALLSPEED = 1000
const JUMPFORCE = 1000
var facing_right = true
var is_hitting = false
var is_ulting = false
const swordPath = preload("res://Asset/Scene/SwordLight.tscn")
onready var health_bar = get_node("/root/World1/CanvasLayer/Health")
var can_ult = true

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
	if Input.is_action_pressed("right") and is_hitting == false and is_ulting == false:
		facing_right = true
		velocity.x = SPEED
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("left") and is_hitting == false and is_ulting == false:
		facing_right = false
		velocity.x = -SPEED
		$AnimatedSprite.play("run")
	else:
		# Implement resistance force an player's movement. (So not move ifinitely)
		velocity.x =  lerp(velocity.x, 0, 0.2)
		if is_hitting == false and is_ulting == false:
			$AnimatedSprite.play("idle")
	if is_on_floor():
		if Input.is_action_pressed("jump"):
			velocity.y = - JUMPFORCE
	if not is_on_floor() and is_hitting == false: 
		if velocity.y < 0:
			$AnimatedSprite.play("jump")
	# Hit
	if Input.is_action_just_pressed("hit"):
		SwordOn(30)
		$AnimatedSprite.play("hit")
		is_hitting = true
	
	if Input.is_action_just_pressed("Ultimate") and can_ult:
		$AnimatedSprite.play("ultimate")
		$Timer2.start()
		health_bar.value += 20
		is_ulting = true
		can_ult = false
		

	
	# Make velocity implmented on player's movement
	velocity = move_and_slide(velocity, Vector2.UP)
	
func SwordOn(damage):
	var sword = swordPath.instance()
	sword.damage = damage
	
	if facing_right == true:
		sword.position = position + Vector2(80, 30)
		get_parent().add_child(sword)
	else:
		sword.position = position + Vector2(-80, 30)
		get_parent().add_child(sword)

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "hit":
		is_hitting = false
	if $AnimatedSprite.animation == "ultimate":
		is_ulting = false
		$Timer.start()
		

func _on_Timer_timeout():
	can_ult = true


func _on_Timer2_timeout():
	SwordOn(50)
	
