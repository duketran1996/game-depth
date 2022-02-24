extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_SwordLight_body_entered(body):
	if "Enemy" in body.name:
		body.health -= 30
	if body:
		queue_free()
