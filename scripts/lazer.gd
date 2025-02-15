extends Node2D

var vel = 200




func _ready():
	pass 



func _process(delta):
	translate(Vector2(0, -1)*vel*delta)
	



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()# destroi o lazer para não sobrecarregar de objetos 


func _on_area_area_entered(area):
	queue_free()
