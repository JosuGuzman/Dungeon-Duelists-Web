extends CharacterBody2D
class_name Player

@onready var movement: Movement = $"Movement" as Movement

var input_vector: Vector2

func _ready():
	movement.setup(self)

func _process(delta):
	input_vector.x = Input.get_axis("move_left", "move_right")
	input_vector.y = Input.get_axis("move_up", "move_down")

func _physics_process(delta):
	movement.move(input_vector.normalized())
