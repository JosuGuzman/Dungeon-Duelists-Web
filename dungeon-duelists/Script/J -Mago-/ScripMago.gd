extends CharacterBody2D

# Constantes de velocidad
const SPEED = 300.0

# Variable para el estado de la animación
var is_running = false

func _physics_process(delta: float) -> void:
	# Obtener el input en ambas direcciones (horizontal y vertical)
	var direction := Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Normalizar el vector de dirección para evitar velocidad excesiva en diagonal
	direction = direction.normalized()

	# Asignar la velocidad de movimiento basada en la dirección del input
	velocity = direction * SPEED
	
	# Cambiar la animación según el estado de movimiento
	if direction != Vector2.ZERO:
		is_running = true
	else:
		is_running = false
	
	# Actualizar la animación
	if is_running:
		$AnimationPlayer.play("run")  # Cambiar a la animación de correr
	else:
		$AnimationPlayer.play("idle")  # Cambiar a la animación de estar quieto
	
	# Mover el personaje usando el método move_and_slide
	move_and_slide()
