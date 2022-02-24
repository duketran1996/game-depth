extends KinematicBody2D

var velocity = Vector2(1, 0)
var speed  = 200



func _physics_process(delta):
	var collision_info = move_and_collide(velocity.normalized()*delta*speed)
	if collision_info:
		if collision_info.collider.name != "MagePlayer":
			queue_free()
