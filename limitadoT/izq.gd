extends TextureButton

onready var player = get_node("/root/main_esce/player")

#
#func _on_LeftButton_pressed():
#	player.move_left()
#
#func _on_LeftButton_released():
#	player.stop_moving()


func _on_izq_pressed():
	player.move_left(5)
	print("hace")
	pass # Replace with function body.
func _on_izq_released():
	player.stop_moving(5)
