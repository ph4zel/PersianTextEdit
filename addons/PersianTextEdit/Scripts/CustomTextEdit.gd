extends TextEdit


func _ready():
	var _temp = connect("text_changed",self,"text_changed")

func text_changed():
	$"../RichTextLabel".text = Persian.toPersian(text)
	remove_children(self)

func remove_children(node:Node):
	if node:
		for child in node.get_children():
			if child is VScrollBar or child is HScrollBar:
				node.remove_child(child)
			if child.get_child_count() > 0:
				remove_children(child)
