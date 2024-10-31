extends Area2D
class_name Sensor

var target : CollisionObject2D
var collisiones = []
var target_distance : get = _get_distance
var taget_direction : 
	get:
		return target.global_position - global_position

func _ready():
	body_entered.connect(strore_body)
	body_exited.connect(remove_body)

func _get_distance() -> float:
	return global_position.distance_to(target.global_position)

func strore_body(body):
	collisiones.append(body)

func remove_body(body):
	collisiones.erase(body)
	
	if collisiones.size() == 0:
		target = null

func  _physics_process(delta):
	scan()

func scan() -> void:
	if collisiones.size() == 0:
		return
	
	var closestBody = find_closest_body(collisiones)
	
	if closestBody != null:
		target = closestBody
	else:
		target = null

func find_closest_body(bodies: Array) -> CollisionObject2D:
	var closestDistance = 100
	var closestBody = null
	
	if bodies.size() == 0:
		target = null
		return
	
	for body in bodies:
		if body != null:
			var distance = body.global_position.distance_to(global_position)
			
			if distance < closestDistance:
				closestDistance = distance
				closestBody = body
				target = closestBody
	
	return closestBody
