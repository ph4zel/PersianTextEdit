# Persian Text Edit
Type Persian in Godot Engine!

![alt text](https://github.com/fazel87/PersianTextEdit/blob/main/Capture_2022_01_08_21_10_18_447.png?raw=true)

# Support
support Godot 3.1 (tested in 3.4 and 3.4.2)

support Persian in Godot {

  **PersianTextEdit**,
	
  **PersianLabel**,
	
  **PersianButton**
	
}

Support All Platforms (Tested on Android and Windows).

# How to install

download release and create new project
  
create 'addons' folder in root
  
extract PersianTextEdit to addons
  
open Project/Projects Settings/Plugins and enable PersianTextEdit
  
reload project(recommand)

# Nodes

Added {PersianLabel , PersianTextEdit , PersianButton} to Node list.

# PersianTextEdit
### signal
text_chaged: if user type text in textedit, emit this signal

### Variable
Text: if set text in editor, Adjusts TextEditor text to text in start game

# PersianLabel

### Variable

Persian Text: Main persian text

Reload In Ready: if true, Persian Text(Variable) generated to Persian Mode (Right to left and more)

Reload Text: if clicked in editor or set in code, generated to Persian Mode (Right to left and more)

# PersianButton

Like PersianLabel
# Learn

### Custom Text View and TextEditor:
open childs folder in plugin root ("res://addons/PersianTextEdit/Childs") and RichTextLabel.tscn or TextEdit.tscn and Customing.

### Change Font
Like above or:
open Fonts folder in plugin root ("res://addons/PersianTextEdit/Fonts") and open Fonts.tres and open Font in inspector and Load font in Font Data

for more learn see example scene

### Issues
Issues are answered

### Contribut
you can add new node to this project. for example : PersianRichTextLabel
