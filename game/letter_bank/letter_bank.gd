class_name LetterBank
extends GridContainer

const CORRECT_COLOR: Color = Color.green
const WRONG_COLOR: Color = Color.red


func _ready() -> void:
	pass


func _highlight_letter(letter: String, color: Color) -> void:
	var lbl_letter: Label = get_node(letter.to_upper())
	lbl_letter.set("custom_colors/font_color", color)

func update_letters(letter: String, correct: bool) -> void:
	if correct:
		_highlight_letter(letter, CORRECT_COLOR)
	else:
		_highlight_letter(letter, WRONG_COLOR)
