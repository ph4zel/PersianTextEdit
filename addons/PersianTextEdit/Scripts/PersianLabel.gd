tool
extends Label

export(String,MULTILINE) var PersianText setget _reload

func _reload(string:String):
	PersianText = string
	text = Persian.toPersian(PersianText)
