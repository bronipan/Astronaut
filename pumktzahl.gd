extends Label
var gesamtpunkte: int

func _init() -> void:
	Ereignisse.connect("start",_on_start)
	Ereignisse.connect("punkte",_on_punkte)

func _on_start():
	gesamtpunkte = 0
	text = "000000"

func  _on_punkte(pkt):
	gesamtpunkte += pkt
	text = "%06d" % gesamtpunkte
