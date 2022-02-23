extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

onready var health_bar = get_node("/root/World1/CanvasLayer/Health")
onready var health_shape = get_node("HealthCollisionShape2D")
onready var health = get_node(".")

func _on_Health_body_entered(player) -> void:
	if player.name != "DungeonMap":
		health_bar.value += 10
		health.hide()
		health_shape.set_deferred("disabled", true)
