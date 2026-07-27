extends Control

@onready var title = $CenterContainer/VBoxContainer/Title
@onready var subtitle = $CenterContainer/VBoxContainer/Subtitle

func _ready():
	title.text = "mrLaserbeam00-dungeon"
	subtitle.text = "The Dungeon Awakens...\n\nMaximum AI Power Engaged."
	print("Crawler has entered the Godot chamber.")

func _process(delta):
	pass
