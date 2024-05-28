extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var down = $"Turn Detection/Down"
@onready var up = $"Turn Detection/Up"
@onready var left = $"Turn Detection/Left"
@onready var right = $"Turn Detection/Right"

const SPEED = 40.0
var current_direction = 'left'
var next_direction = 'left'

func _physics_process(delta):
	if Input.is_action_just_pressed('move_left'):
		next_direction = 'left'
	if Input.is_action_just_pressed('move_right'):
		next_direction = 'right'
	if Input.is_action_just_pressed('move_up'):
		next_direction = 'up'
	if Input.is_action_just_pressed('move_down'):
		next_direction = 'down'
	match next_direction:
		'left':
			if not left.is_colliding():
				current_direction = next_direction
		'right':
			if not right.is_colliding():
				current_direction = next_direction
		'up':
			if not up.is_colliding():
				current_direction = next_direction
		'down':
			if not down.is_colliding():
				current_direction = next_direction
	match current_direction:
		'left':
			velocity.x = -SPEED
			velocity.y = 0
			animated_sprite.play('Leftward')
		'right':
			velocity.x = SPEED
			velocity.y = 0
			animated_sprite.play('Rightward')
		'up':
			velocity.x = 0
			velocity.y = -SPEED
			animated_sprite.play('Upward')
		'down':
			velocity.x = 0
			velocity.y = SPEED
			animated_sprite.play('Downward')
	move_and_slide()
