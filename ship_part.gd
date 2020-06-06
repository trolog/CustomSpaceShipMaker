extends Area2D

export var is_body : bool
export var is_gun : bool

export var bullet : PackedScene

var mouse_over = false
var mouse_left_down = false
var attach_mouse = false

var main_ship : Node2D

func _ready():
	main_ship = get_node("/root/main/player_ship")
	connect("mouse_entered",self,"mouse_enter")
	connect("mouse_exited",self,"mouse_leave")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(mouse_over):
		if(is_body):
			if(Input.is_action_just_pressed("mb_left")):
				get_parent().remove_child(self)
				main_ship.add_child(self)
				self.position = Vector2(0,0)
		else:
			if(Input.is_action_just_released("mb_left")):
				get_parent().remove_child(self)
				main_ship.add_child(self)
				self.global_position = global_position
	
	if (Input.is_action_just_pressed("mb_left")):
		mouse_left_down = false
		
	if(!is_body):
		if(mouse_over):
			if(Input.is_action_just_pressed("mb_left")):
				attach_mouse = true
		if(attach_mouse):
			global_position = get_global_mouse_position()
			if(Input.is_action_just_released("mb_left")):
				attach_mouse = false
			
	if(is_gun and Input.is_action_pressed("ui_accept")):
		var fire_bullet = bullet.instance()
		get_tree().current_scene.add_child(fire_bullet)
		fire_bullet.global_position = global_position
			
	pass

func mouse_enter():
	mouse_over = true
	
func mouse_leave():
	mouse_over = false
