extends Area2D

var velocity = Vector2(1, 0)
var speed  = 200
var damage = 30


func _physics_process(delta):
	translate(velocity * speed * delta)
	$AnimatedSprite.play("default")



func _on_Bullet_body_entered(body):
	if "Enemy" in body.name:
		body.health -= damage
	if body:
		queue_free()
