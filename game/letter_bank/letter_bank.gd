class_name LetterBank
extends GridContainer

const CORRECT_COLOR: Color = Color.green
const WRONG_COLOR: Color = Color.red
const USED_COLOR: Color = Color.black


func _ready() -> void:
	self.reset()


func _highlight_letter(letter: String, color: Color) -> void:
	var lbl_letter: Label = get_node(letter.to_upper())
	lbl_letter.set("custom_colors/font_color", color)

func update_letters(letter: String, correct: bool) -> void:
	###### print(str(letter), " was entered and is: ", (correct))
	_highlight_letter(letter, USED_COLOR)
#	if correct:
#		_highlight_letter(letter, CORRECT_COLOR)
#	else:
#		_highlight_letter(letter, WRONG_COLOR)

func reset() -> void:
	for c in self.get_children():
		c.set("custom_colors/font_color", Color.whitesmoke)
