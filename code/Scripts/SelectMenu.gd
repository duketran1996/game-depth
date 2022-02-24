extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_MageButton_pressed():
	Global.selectedCharacter += 0
	get_tree().change_scene("res://Asset/Scene/World1.tscn")


func _on_WarriorButton_pressed():
	Global.selectedCharacter += 1
	get_tree().change_scene("res://Asset/Scene/World1.tscn")
