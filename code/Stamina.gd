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

onready var stam_bar = get_node("/root/World1/CanvasLayer/Stamina")
onready var stam_shape = get_node("StaminaCollisionShape2D")
onready var stam = get_node(".")

func _on_Stamina_body_entered(player):
	if player.name != "DungeonMap":
		stam_bar.value += 10
		stam.hide()
		stam_shape.set_deferred("disabled", true)
