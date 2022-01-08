tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("PersianTextEdit","Panel", preload("PersianTextEdit.gd"), preload("../Icon/PersianTextEditIcon.png"))
	add_custom_type("PersianLabel","Label", preload("PersianLabel.gd"), preload("../Icon/PersianTextEditIcon.png"))
	add_custom_type("PersianButton","Button", preload("PersianButton.gd"), preload("../Icon/PersianTextEditIcon.png"))

func _exit_tree():
	remove_custom_type("PersianTextEdit")
	remove_custom_type("PersianLabel")
	remove_custom_type("PersianButton")
