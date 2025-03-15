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
	Ereignisse.emit_signal("gameover")
	hide()
	$CollisionPolygon2D.set_deferred("disabled",true)
	
	
func _on_start():
	show()
	position.y= get_viewport_rect().get_center().y
	$CollisionPolygon2D.set_deferred("disabled",false)
	
