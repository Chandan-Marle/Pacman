extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D


const SPEED = 100.0
var current_direction = 'left'
var next_direction = 'left'
@onready var left_1 = $Left1
@onready var right_1 = $Right1
@onready var left_2 = $Left2
@onready var left_3 = $Left3
@onready var right_2 = $Right2
@onready var right_3 = $Right3
@onready var up_1 = $Up1
@onready var up_3 = $Up3
@onready var up_2 = $Up2
@onready var down_1 = $Down1
@onready var down_2 = $Down2
@onready var down_3 = $Down3

func _process(delta):
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
			if not (left_1.is_colliding() or left_2.is_colliding() or left_3.is_colliding()):
				current_direction = next_direction
		'right':
			if not (right_1.is_colliding() or right_2.is_colliding() or right_3.is_colliding()):
				current_direction = next_direction
		'up':
			if not (up_1.is_colliding() or up_2.is_colliding() or up_3.is_colliding()):
				current_direction = next_direction
		'down':
			if not (down_1.is_colliding() or down_2.is_colliding() or down_3.is_colliding()):
				current_direction = next_direction
	match current_direction:
		'left':
			velocity.x = -SPEED
			velocity.y = 0
			animated_sprite.play("Leftward")
		'right':
			velocity.x = SPEED
			velocity.y = 0
			animated_sprite.play("Rightward")
		'up':
			velocity.x = 0
			velocity.y = -SPEED
			animated_sprite.play("Upward")
		'down':
			velocity.x = 0
			velocity.y = SPEED
			animated_sprite.play("Downward")
	move_and_slide()
