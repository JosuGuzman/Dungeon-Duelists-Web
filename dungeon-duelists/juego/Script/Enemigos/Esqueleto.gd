extends CharacterBody2D
class_name Enemy

@onready var movement: Movement = $"Movement" as Movement
@onready var sensor: Sensor = $"Sensor" as Sensor

var player: CollisionObject2D

func _ready():
	movement.setup(self)

func _physics_process(delta):
	
	if sensor.target != null:

		if sensor.target_distance > 100:
			movement.move(sensor.taget_direction)
.
