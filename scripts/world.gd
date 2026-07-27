extends Node2D

@onready var debug_label: Label = $CanvasLayer/UI/DebugLabel

func _ready():
	print("World scene loaded. The real dungeon begins here.")
	debug_label.text = "World Scene Active\nMove with Arrow Keys / A D\nJump with Space\nPress R to restart"

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") or (event is InputEventKey and event.pressed and event.keycode == KEY_R):
		get_tree().reload_current_scene()
