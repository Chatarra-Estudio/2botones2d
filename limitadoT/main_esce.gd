extends Node2D

var door_scene = preload("res://puerta.tscn")
var doors_per_spawn = 0
var next_door_x_offset = 0  # Distancia entre las siguientes puertas
var random_spawn = true
var posi = 0

var contaW = 35

func _ready():
	$tpue.start()
	$hub/cont/twin.start(1)
	$hub/cont/Label.set_text(str(contaW) + "s 4 win")

func _on_tpue_timeout():
	doors_per_spawn += 1
	random_spawn = true
#	print("puerta")
#	var door_instance = door_scene.instance()
#	door_instance.position.x = rand_range(-10, 1100)  # Posición x aleatoria
#	add_child(door_instance)
	
	for i in range(doors_per_spawn):
		if not random_spawn:
			next_door_x_offset += 65
#			print("la n", i, posi)
		spawn_door()
		if i == doors_per_spawn - 1:
#			print("ultima: ", i, ", posi: ", posi,", puertas: ", doors_per_spawn)
			next_door_x_offset = 0
#		print("np: ", i, ", posi: ", posi)

func spawn_door():
	var door_instance = door_scene.instance()
	if random_spawn:
		door_instance.position.x = rand_range(1, 1050) # Posición x aleatoria
		posi = door_instance.position.x
		random_spawn = false
#		print("la primera" , door_instance.position.x, next_door_x_offset )
		
	else:
		if posi < 512:
			door_instance.position.x = posi + next_door_x_offset
		else:
			door_instance.position.x = posi - next_door_x_offset
		
	var main_scene = get_tree().get_root().get_node("main_esce")
	main_scene.add_child(door_instance)
	
	
	door_instance.set_process(true)
	door_instance.set_physics_process(true)


func _on_twin_timeout():

	$hub/cont/Label.set_text(str(contaW) + "s 4 win")
	if contaW < 0:
		$hub/cont/twin.start(4)
		$hub/cont/Label.set_text("You win mmáquina!")
		print($win.show())
#		$player.vivo = false
		if contaW < -10:
			print(get_tree().reload_current_scene())
		else:
			contaW -= 12
			
	else:
		$hub/cont/twin.start(1)
		contaW -= 1
	pass # Replace with function body.
