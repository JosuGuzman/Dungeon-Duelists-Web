extends Node
class_name Movement
	
var speed: float = 120
var max_speed: float = 125

var character : CharacterBody2D

func setup(character2D : CharacterBody2D):
	character = character2D

func move(input_vector : Vector2):
	character.velocity = input_vector.normalized() * speed
	character.move_and_slide()

func stop_movement():
	character.velocity = Vector2.ZERO
