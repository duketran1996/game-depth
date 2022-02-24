extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var selectedCharacter = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_MageButton_pressed():
	SelectMenu.selectedCharacter += 0
	print(selectedCharacter)
	get_tree().change_scene("res://Asset/Scene/World1.tscn")


func _on_WarriorButton_pressed():
	SelectMenu.selectedCharacter += 1
	print(selectedCharacter)
	get_tree().change_scene("res://Asset/Scene/World1.tscn")
