extends Node2D

var speed = 100  # Velocidad de descenso

func _ready():
	print($".".position)
	$Sprite/Label.set_text(str(int($".".position.x)))

func _physics_process(delta):
	position.y += speed * delta  # Mover la puerta hacia abajo

	if position.y > get_viewport_rect().size.y:
		queue_free()  

func _on_Area2D_body_entered(_body):
#	print("entra 2")
	get_parent().get_child(1).vivo = false
	pass # Replace with function body.
