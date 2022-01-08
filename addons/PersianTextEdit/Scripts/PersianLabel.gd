tool
extends Label

export(String,MULTILINE) var PersianText
export(bool) var reload_in_ready = false
export(bool) var reload_Text setget _reload

func _ready():
	if reload_in_ready:
		_reload()

func _reload(_temp=null):
	text = Persian.toPersian(PersianText)
