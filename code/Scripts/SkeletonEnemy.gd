extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gravity = 10
var velocity = Vector2(0, 0)
var speed = 30
var is_moving_right = true
var is_hitting = false
var is_dead = false
var health = 120

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("Walk")


func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("dead")
	$CollisionShape2D.disabled = true
	$Timer.start()

func _physics_process(delta):
	if health <= 0 and !is_dead:
		dead()
	if is_dead == false:
		if !is_hitting:
			$AnimatedSprite.play("Walk")
			velocity.x = speed if is_moving_right else -speed
			velocity.y = velocity.y + gravity
			velocity = move_and_slide(velocity, Vector2.UP)
			if not $RayCast2D.is_colliding() or is_on_wall():
				is_moving_right = !is_moving_right
				scale.x = -scale.x

func _on_Timer_timeout():
	queue_free()

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Attack":
		is_hitting = false

func _on_PlayerDetector_body_entered(body):
	if "Player" in body.name:
		is_hitting = true
		$AnimatedSprite.play("Attack")
		body.health_bar.value -= 3




