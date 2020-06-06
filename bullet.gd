extends Area2D

export var bullet_speed = 15



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y -= bullet_speed
	
	if(global_position.y < 0):
		queue_free()
	pass
