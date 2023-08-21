extends KinematicBody2D

var speed = 400  # Velocidad de movimiento
var velocity = Vector2.ZERO
var vivo = true

func _ready():
	$Sprite2.play()

func _physics_process(_delta):
	if vivo:
		velocity.x = 0  # Reiniciar la velocidad en cada frame
		if(get_parent().get_child(5).get_child(0).pressed):
			velocity.x += 1
		if(get_parent().get_child(5).get_child(1).pressed): # 1 izquierda
			velocity.x -= 1
#		print(get_parent().get_child(5).get_child(0).pressed)
#		print(get_parent().get_child(5).get_child(1).pressed) # 1 izquierda
		
#		if $der.pressed:
#			velocity.x += 1
#
#		if $izq.pressed:
#			velocity.x -= 1

		velocity = velocity.normalized() * speed
		velocity = move_and_slide(velocity)
		if $".".position.x < 1:
			$".".position.x = 1
			
		if $".".position.x > 1024:
			$".".position.x = 1024
	else:
		if $tgo.is_stopped():
			vivo = false
			$tgo.start(3)
			$Sprite2.stop()
			print($tgo.is_stopped(), "poner game over esta muerto")
			get_parent().get_child(3).show()
#			print(get_parent().get_child(3))
#			print(get_parent)
#	print($".".position.x)
#	for puerta in get_tree().get_nodes_in_group("doors"):
#		print("entra")
##		puerta.position.y += velocity.y * delta


func _on_tgo_timeout():
	print("reinicio game over")
	print(get_tree().reload_current_scene())
	pass # Replace with function body.
