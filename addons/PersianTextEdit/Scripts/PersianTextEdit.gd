extends Panel

export(String,MULTILINE) var text:String

var richtextlabel = preload("../Childs/RichTextLabel.tscn").instance()
var textedit = preload("../Childs/TextEdit.tscn").instance()

signal text_changed(_text)

func _ready():
	add_child(richtextlabel)
	add_child(textedit)
	if textedit.get_signal_connection_list("text_changed") == []:
		textedit.connect("text_changed",self,"text_changed")

func text_changed():
	text = textedit.text
	emit_signal("text_changed",text)
