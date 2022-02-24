extends Area2D

var damage = 30

func _ready():
	$Timer.start()


func _on_SwordLight_body_entered(body):
	if "Enemy" in body.name:
		body.health -= damage
	if body:
		queue_free()



func _on_Timer_timeout():
	queue_free()
