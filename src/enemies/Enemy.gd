extends CharacterBody2D

const speed = 150.0
const type = "Enemy"

var direction = Vector2.RIGHT

func patrol(delta):
		# Check if the enemy has hit a wall
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		# If the enemy hit a wall, change direction
		direction = -direction

func _physics_process(delta):
	pass

func _process(delta):
	pass
