extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var damage = 30

func _on_SwordLight_body_entered(body):
	if "Enemy" in body.name:
		body.health -= damage
	if body:
		queue_free()
