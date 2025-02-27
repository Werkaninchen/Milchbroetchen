extends Node

var body

func _ready():
	body = get_parent()
	body.register_controler(self)

#func set_controller_device_id(id):
#	controller_device_id = id
	
func joy_input(event):
	# set movement_direction
	if event is InputEventJoypadMotion:
		
		if event.axis == JOY_AXIS_0:
			if event.axis_value >= 0.3:
				body.wanted_direction.x = event.axis_value
				
			elif event.axis_value <= -0.3:
				body.wanted_direction.x = event.axis_value
				
			else:
				body.wanted_direction.x = 0
				
		if event.axis == JOY_AXIS_1:
			if event.axis_value >= 0.3:
				body.wanted_direction.y = event.axis_value
				
			elif event.axis_value <= -0.3:
				body.wanted_direction.y = event.axis_value
				
			else:
				body.wanted_direction.y = 0
	
	if event is InputEventJoypadButton:
		if event.button_index == JOY_R2:
			body.attack_primary.attack()
		if event.button_index == JOY_L2:
			body.attack_secondary.attack()
			
	
	#	# set looking direction
	#	if event.axis == JOY_AXIS_2:
	#		if abs(event.axis_value) > 0.1:
	#
	#			if sign(body.looking_direction.x) != sign(event.axis_value):
	#				body.emit_signal("looking_direction_changed", event.axis_value)
	#
	#			body.looking_direction.x = event.axis_value
	#
	#		else:
	#			body.looking_direction.x = 0
	#
	#	if event.axis == JOY_AXIS_3:
	#		if abs(event.axis_value) > 0.1:
	#			body.looking_direction.y = event.axis_value
	#
	#		else:
	#			body.looking_direction.y = 0