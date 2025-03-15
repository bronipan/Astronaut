extends Area2D

func _init() -> void:
	Ereignisse.connect("start",_on_start)

func _process(delta: float) -> void:
	if Input.is_action_pressed("rauf"):
		position.y-=400*delta
		
	if Input.is_action_pressed("runter"):
		position.y+=400*delta

	if Input.is_action_pressed("rechts"):
		position.x+=400*delta
		
	if Input.is_action_pressed("links"):
		position.x-=400*delta
		
	position = position.clamp(Vector2.ZERO, get_viewport_rect().size)
	

func _on_body_entered(body: Node2D) -> void:
	if body.get_meta("typ") == "goldmunze":
		Ereignisse.emit_signal("punkte",1000)
		body.queue_free()
		return

	Ereignisse.emit_signal("gameover")
	hide()
	$CollisionPolygon2D.set_deferred("disabled",true)
	
	
func _on_start():
	show()
	position.y= get_viewport_rect().get_center().y
	position.x=50
	$CollisionPolygon2D.set_deferred("disabled",false)
	
