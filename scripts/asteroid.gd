extends Node2D

var chosen = 0
onready var velY = rand_range( 30 , 200 )
onready var velX = rand_range( -50 , 50 )

signal destroied(node)


func _ready():
	randomize()# deixa os asteroids de forma aleatoria cada vez que incia o game
	# abaixo o laço for q deixa os asteroids invisiveis
	for a in $asteroids.get_children():
		a.visible = false
		
		if not chosen:
			
			#ABAIXO RANDOMIZA UM DOS 5 ASTEROIDS PARA NÃO APARECER#
			chosen = (randi() % $asteroids.get_child_count()) + 1
		
		var node = get_node("asteroids/asteroid-" + str(chosen)) 
		
		node.visible = true
		 #abaixo atraves do cód aumentamos o raio de colisao
		 #para o tamanho do meteoro
		$area/shape.shape.radius = node.texture.get_width() / 2
		

func _process(delta):
	translate(Vector2( velX, velY ) * delta )
	
	if global_position.x > 200 :
		   global_position.x = - 40
	if global_position.x < - 40:
		   global_position.x = 200
	if global_position.y > 300 :
	 global_position.y = -60

func _on_area_area_entered(area):
	
	get_tree().call_group("camera" , "treme" , 1.5  )
	emit_signal("destroied" , self)
	queue_free()
