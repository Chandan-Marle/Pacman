extends CharacterBody2D

@onready var animatedSprite = $AnimatedSprite2D
@onready var down = $"Turn Detection/Down"
@onready var up = $"Turn Detection/Up"
@onready var left = $"Turn Detection/Left"
@onready var right = $"Turn Detection/Right"

const SPEED = 40.0
var currentDirection = 'left'
var nextDirection = 'left'

func _physics_process(delta):
	if Input.is_action_just_pressed('move_left'):
		nextDirection = 'left'
	if Input.is_action_just_pressed('move_right'):
		nextDirection = 'right'
	if Input.is_action_just_pressed('move_up'):
		nextDirection = 'up'
	if Input.is_action_just_pressed('move_down'):
		nextDirection = 'down'
	match nextDirection:
		'left':
			if not left.is_colliding():
				currentDirection = nextDirection
		'right':
			if not right.is_colliding():
				currentDirection = nextDirection
		'up':
			if not up.is_colliding():
				currentDirection = nextDirection
		'down':
			if not down.is_colliding():
				currentDirection = nextDirection
	match currentDirection:
		'left':
			velocity.x = -SPEED
			velocity.y = 0
			animatedSprite.play('Leftward')
		'right':
			velocity.x = SPEED
			velocity.y = 0
			animatedSprite.play('Rightward')
		'up':
			velocity.x = 0
			velocity.y = -SPEED
			animatedSprite.play('Upward')
		'down':
			velocity.x = 0
			velocity.y = SPEED
			animatedSprite.play('Downward')
	move_and_slide()
