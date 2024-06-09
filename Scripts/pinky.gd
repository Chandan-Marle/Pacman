extends CharacterBody2D

var current_scatter_index = 0

@export var speed: float = 39
@export var movement_targets: Resource

@onready var navigation_agent_2d = $NavigationAgent2D

func _ready():
	navigation_agent_2d.path_desired_distance = 0.1
	navigation_agent_2d.target_desired_distance = 0.1
	navigation_agent_2d.target_reached.connect(on_position_reached)
	call_deferred("setup")

func setup():
	navigation_agent_2d.set_navigation_map(tile_map.get_navigation_map(0))
	NavigationServer2D.agent_set_map(navigation_agent_2d.get_rid(), tile_map.get_navigation_map(0))

func _process(delta):
	move_ghost(navigation_agent_2d.get_next_path_position(), delta)

func move_ghost(next_position):
	var current_ghost_position = global_position
	var new_velocity = (next_position - current_ghost_position).normalized() * speed
	position += new_velocity

func scatter():
	if current_scatter_index < 3:
		var target = movement_targets.get("target_" + str(current_scatter_index))
		navigation_agent_2d.target_position = target
		current_scatter_index += 1
	else:
		current_scatter_index = 0

func on_position_reached():
	print("Position reached")
