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

onready var coin_shape = get_node("CoinCollisionShape2D")
onready var coin = get_node(".")

func _on_coin_body_entered(player):
	if player.name != "DungeonMap":
		coin.hide()
		coin_shape.set_deferred("disabled", true)
