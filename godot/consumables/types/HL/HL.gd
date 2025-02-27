extends "res://consumables/base/Consumable.gd"

export var health_up = 10

func init():
	consumableType = enums.ConsumType.Health

func on_body_entered(body):
	.on_body_entered(body)
	if body is character:
		
		linkBody.current_health += health_up
		
		linkBody.sounds.stream = linkBody.sounds.health
		linkBody.sounds.play()
		return
	queue_free()