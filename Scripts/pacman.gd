extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 100.0


func _physics_process(delta):

	# Handle jump.
	if Input.is_action_just_pressed("move_up"):
		velocity.x = 0
		velocity.y = -SPEED
		animated_sprite.play("Upward")
	elif Input.is_action_just_pressed("move_down"):
		velocity.x = 0
		velocity.y = SPEED
		animated_sprite.play("Downward")
	elif Input.is_action_just_pressed("move_left"):
		velocity.x = -SPEED
		velocity.y = 0
		animated_sprite.play("Leftward")
	elif Input.is_action_just_pressed("move_right"):
		velocity.x = SPEED
		velocity.y = 0
		animated_sprite.play("Rightward")
	move_and_slide()
