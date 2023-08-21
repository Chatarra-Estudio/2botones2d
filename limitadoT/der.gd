extends TextureButton

onready var player = get_node("/root/main_esce/player")

func _on_RightButton_pressed():
	player.move_right(10)

func _on_RightButton_released():
	player.stop_moving(10)
