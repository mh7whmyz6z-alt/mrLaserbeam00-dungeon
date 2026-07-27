extends Node2D

@onready var label = $Label

func _ready():
	label.text = "The Dungeon Awakens...\n\nMaximum AI Power Engaged."
	print("Crawler has entered the Godot chamber.")

func _process(delta):
	# The Architect is always watching
	pass
