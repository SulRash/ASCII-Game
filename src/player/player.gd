extends Area2D

var hp
var strength
var defense
var sanity
var divinity
var magic
var velocity

var speed = 100

func _ready():
	$CollisionShape2D.disabled = false

func set_stats():
	pass

func _process(delta):
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
