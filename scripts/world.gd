extends Node2D

@onready var level: Node2D = $Level
@onready var debug_label: Label = $CanvasLayer/UI/DebugLabel

# === LAYOUT DATA (edit this to change the level) ===
var platforms = [
	{"x": 300, "y": 520, "width": 300},   # Starting platform
	{"x": 700, "y": 440, "width": 280},
	{"x": 1100, "y": 360, "width": 260},
	{"x": 600, "y": 280, "width": 240},
	{"x": 200, "y": 200, "width": 220},
]

func _ready() -> void:
	print("World scene loaded (code-driven layout).")
	_spawn_platforms()
	_position_player_on_first_platform()
	
	debug_label.text = "World Scene (code-driven)\nArrow keys / A D + Space\nR = restart"

func _spawn_platforms() -> void:
	for p in platforms:
		var body := StaticBody2D.new()
		body.position = Vector2(p.x, p.y)
		
		var shape := CollisionShape2D.new()
		var rect := RectangleShape2D.new()
		rect.size = Vector2(p.width, 40)
		shape.shape = rect
		body.add_child(shape)
		
		var visual := ColorRect.new()
		visual.size = Vector2(p.width, 40)
		visual.position = Vector2(-p.width / 2, -20)
		visual.color = Color(0.6, 0.4, 0.2)
		body.add_child(visual)
		
		level.add_child(body)

func _position_player_on_first_platform() -> void:
	if platforms.size() == 0:
		return
	
	var first := platforms[0]
	# Place player so its feet rest on the platform top
	$Player.position = Vector2(first.x, first.y - 52)   # 52 = half player height + platform half-height

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel") or (event is InputEventKey and event.pressed and event.keycode == KEY_R):
		get_tree().reload_current_scene()
