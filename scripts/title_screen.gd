extends Control

func _ready():
	print("Title screen ready. Press any key to enter the dungeon.")

func _unhandled_input(event):
	if event is InputEventKey or event is InputEventMouseButton:
		if event.pressed:
			get_tree().change_scene_to_file("res://scenes/world.tscn")
