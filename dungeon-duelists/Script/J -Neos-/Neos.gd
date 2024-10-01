extends Node2D

# Variables de movimiento
var velocidad_normal = 200
var velocidad_correr = 400
var velocidad_actual = velocidad_normal
var direccion = Vector2.ZERO
var tiempo_doble_pulso = 0.3 # Tiempo máximo para considerar un doble pulsado
var ultima_tecla_presionada = ""
var temporizador_doble_pulso = 0.0

func _physics_process(delta):
	# Inicializamos el vector de dirección
	direccion = Vector2.ZERO
	
	# Movimiento básico usando teclas de flecha
	if Input.is_action_pressed("ui_up"):
		direccion.y -= 1
	elif Input.is_action_pressed("ui_down"):
		direccion.y += 1
	elif Input.is_action_pressed("ui_left"):
		direccion.x -= 1
	if Input.is_action_pressed("ui_right"):
		direccion.x += 1

	# Detectar doble pulsado para correr
	if Input.is_action_just_pressed("ui_right"):
		if ultima_tecla_presionada == "ui_right" and temporizador_doble_pulso < tiempo_doble_pulso:
			velocidad_actual = velocidad_correr
		else:
			velocidad_actual = velocidad_normal
		ultima_tecla_presionada = "ui_right"
		temporizador_doble_pulso = 0.0
	
	if Input.is_action_just_pressed("ui_left"):
		if ultima_tecla_presionada == "ui_left" and temporizador_doble_pulso < tiempo_doble_pulso:
			velocidad_actual = velocidad_correr
		else:
			velocidad_actual = velocidad_normal
		ultima_tecla_presionada = "ui_left"
		temporizador_doble_pulso = 0.0

	# Incrementar el temporizador para el doble pulsado
	temporizador_doble_pulso += delta

	# Normalizamos el vector de dirección para evitar movimiento diagonal más rápido
	if direccion != Vector2.ZERO:
		direccion = direccion.normalized()
