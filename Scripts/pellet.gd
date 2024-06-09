extends Area2D

@onready var gameManager =  %GameManager
func _on_body_entered(body):
	gameManager.addPelletPoint()
	queue_free()
