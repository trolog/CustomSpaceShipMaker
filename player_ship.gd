extends Node2D

var ship_speed = 5

func _ready():
	pass # Replace with function body.

func _process(delta):
	if(Input.is_action_pressed("ui_down")):
		global_position.y += ship_speed
	if(Input.is_action_pressed("ui_up")):
		global_position.y -= ship_speed
	if(Input.is_action_pressed("ui_right")):
		global_position.x += ship_speed
	if(Input.is_action_pressed("ui_left")):
		global_position.x -= ship_speed
		
	if(Input.is_action_just_pressed("mb_right")):
		save_ship()
	pass
	
func save_ship():
	var tosave = PackedScene.new()
	
	get_parent().remove_child(self)
	
	for n in self.get_children():
		n.owner = self
		for j in n.get_children():
			j.owner = self
	
	tosave.pack(self)
	ResourceSaver.save("res://player_ship.tscn",tosave)
			
	
	
	
	
	
	
	
	
