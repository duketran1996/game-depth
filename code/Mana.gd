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

onready var mana_bar = get_node("/root/World1/CanvasLayer/Mana")
onready var mana_shape = get_node("ManaCollisionShape2D")
onready var mana = get_node(".")
	
		

func _on_Mana_body_entered(player):
	if player.name != "DungeonMap":
		mana_bar.value += 10
		mana.hide()
		mana_shape.set_deferred("disabled", true)
