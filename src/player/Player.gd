extends CharacterBody2D

var hp
var strength
var defense
var sanity
var divinity
var magic

var type = "Player"
var speed = 100

func _ready():
	$CollisionShape2D.disabled = false

func set_stats():
	pass

func collision_detect(collision):
	var body = collision.get_collider()
	if body.get_class() == "CharacterBody2D":
		if body.type == "Enemy":
			print("Hello")

func _process(delta):
	velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	elif Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	elif Input.is_action_pressed("move_up"):
		velocity.y -= 1
	

	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		collision_detect(collision)

	if velocity.x != 0:
		$AnimatedSprite2D.animation = "run"
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "run"
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.animation = "idle"
		$AnimatedSprite2D.play()
