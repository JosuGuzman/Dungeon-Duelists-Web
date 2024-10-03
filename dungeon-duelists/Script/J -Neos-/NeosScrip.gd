extends CharacterBody2D

@export var speed = 45
@export var acceleration = 20
@export var friction = 40
var velocity : Vector2 = Vector2.ZERO

onready var sprite = $MagoSprite/Sprite
onready var animPlayer = $MagoSprite/AnimMago

func _physics_process(delta):
	var input_dir = Vector2()
	input_dir.x = Input.get_axis("move_left", "move_right")
	input_dir.y = Input.get_axis("move_up", "move_down")

	velocity = velocity.move_toward(input_dir * speed, acceleration * delta)
	velocity = move_and_slide(velocity)

	if velocity != Vector2.ZERO:
		animPlayer.play("Run")
	else:
		animPlayer.play("Idle")

	update_rotation()

func update_rotation():
	sprite.flip_h = velocity.x < 0
