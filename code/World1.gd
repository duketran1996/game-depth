extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var m = load("res://Asset/Scene/MagePlayer.tscn")
var w = load("res://Asset/Scene/WarriorPlayer.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var instance
	print(SelectMenu.selectedCharacter)
	if SelectMenu.selectedCharacter == 0:
		instance = m.instance()
		instance.position = Vector2(-121, 560)
		add_child(instance)
	else:
		instance = w.instance()
		instance.position = Vector2(-121, 560)
		add_child(instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
