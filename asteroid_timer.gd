extends Timer

@export var asteroidenfeld:Node2D

var erzeugteAsteroiden: int

func _on_timeout() -> void:
	erzeugteAsteroiden+=1
	var schwierigkeit= erzeugteAsteroiden/20
	
	# Vytvorit duplikat nahodneho potomka v nahodnem miste
	var a=randi_range(1,get_child_count())
	var neuerAsteroid:RigidBody2D=get_child(a-1).duplicate()
	neuerAsteroid.visible=true
	neuerAsteroid.position.x=1700
	neuerAsteroid.position.y=randi_range(20,880)
	
	# Zmensovani objektu, nutno zmenit rucne velikost sprite i collisionshape, vsechno kruznice
	var newScale=randf_range(0.5,1)
	print("New object ",neuerAsteroid.name," scaled ",newScale)
	neuerAsteroid.get_node("Sprite2D").scale*=Vector2(newScale,newScale)
	neuerAsteroid.get_node("CollisionShape2D").shape = neuerAsteroid.get_node("CollisionShape2D").shape.duplicate()
	neuerAsteroid.get_node("CollisionShape2D").shape.radius*=newScale
	
	# Zmenit rodice, aby se mi nehromadily u mne
	asteroidenfeld.add_child(neuerAsteroid)
	
	neuerAsteroid.apply_impulse(Vector2(-randf_range(300+schwierigkeit*50,
		600+schwierigkeit*100),0))
	Ereignisse.emit_signal("punkte",(schwierigkeit+1)*10)

func _init() -> void:
	Ereignisse.connect("start",_on_start)
	Ereignisse.connect("gameover",_on_gameover)
	
func _on_start():
	erzeugteAsteroiden=0
	start()
	
func _on_gameover():
	stop()
	for i in asteroidenfeld.get_children():
		i.queue_free()
	
	
