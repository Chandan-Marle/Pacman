extends CharacterBody2D

#Testing comment

const SPEED = 100.0

func _physics_process(delta):

	# Handle jump.
	if Input.is_action_just_pressed("move_up"):
		velocity.x = 0
		velocity.y = -SPEED
	elif Input.is_action_just_pressed("move_down"):
		velocity.x = 0
		velocity.y = SPEED
	elif Input.is_action_just_pressed("move_left"):
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_just_pressed("move_right"):
		velocity.x = SPEED
		velocity.y = 0
		

	move_and_slide()
