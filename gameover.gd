extends Label

func _init() -> void:
	Ereignisse.connect("start",_on_start)
	Ereignisse.connect("gameover",_on_gameover)

func _on_start():
	hide()
	
func _on_gameover():
	show()
