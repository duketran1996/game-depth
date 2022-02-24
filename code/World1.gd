extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var m = load("res://Asset/Scene/MagePlayer.tscn")
var w = load("res://Asset/Scene/WarriorPlayer.tscn")

onready var mana = get_node("CanvasLayer/Mana")
onready var mana_icon = get_node("CanvasLayer/Mana2")
onready var stam = get_node("CanvasLayer/Stamina")
onready var stam_icon = get_node("CanvasLayer/Sword")

# Called when the node enters the scene tree for the first time.
func _ready():
	var instance
	print(SelectMenu.selectedCharacter)
	if SelectMenu.selectedCharacter == 0:
		instance = m.instance()
		instance.position = Vector2(-121, 560)
		add_child(instance)
		
		mana.set_deferred("visible", true)
		mana_icon.set_deferred("visible", true)
		
	else:
		instance = w.instance()
		instance.position = Vector2(-121, 560)
		add_child(instance)

		stam.set_deferred("visible", true)
		stam_icon.set_deferred("visible", true)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
