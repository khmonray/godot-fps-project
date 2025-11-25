extends Node3D

var sensitivity = 0.2

func _ready() -> void:
	#скрывает курсор мыши
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		#задается скорость вращения игрока по оси y
		get_parent().rotate_y(deg_to_rad(-event.relative.x * sensitivity))
		#задается скорость вращения камеры по оси x
		rotate_x(deg_to_rad(-event.relative.y * sensitivity))
		#задается угол обзора вниз-вверх
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))
