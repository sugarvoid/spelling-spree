class_name LetterBank
extends Control

signal on_letter_pressed

const CORRECT_COLOR: Color = Color.GREEN
const WRONG_COLOR: Color = Color.RED
const USED_COLOR: Color = Color.BLACK

const _ALL_LETTERS: Array = [
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
	]

var _letters_left: Array = []

func _ready() -> void:
	self.reset()
	self._connect_button_signals()


func is_letter_avilible(letter: String) -> bool:
	# TODO: check if button is disabled
	print("checking if letter is been used")
	return $Buttons.get_node(letter.to_upper()).disabled
	#return self._letters_left.has(letter)

func _highlight_letter(letter: String, color: Color) -> void:
	var lbl_letter: Label = get_node(letter.to_upper())
	lbl_letter.set("theme_override_colors/font_color", color)

func update_letters(letter: String, correct: bool) -> void:
	###### print(str(letter), " was entered and is: ", (correct))
	_highlight_letter(letter, USED_COLOR)
#	if correct:
#		_highlight_letter(letter, CORRECT_COLOR)
#	else:
#		_highlight_letter(letter, WRONG_COLOR)

func _send_letter_up(letter: String) -> void:
	if is_letter_avilible(letter):
		var el = _letters_left.find(letter)
		print(el)
		self._letters_left.erase(el)
		emit_signal("on_letter_pressed", letter)
	else:
		print("letter was used already")

func  _connect_button_signals() -> void:
	for c in $Buttons.get_children():
		c.connect("was_pressed", self._send_letter_up)

func reset() -> void:
	self._letters_left.clear()
	self._letters_left = [] + self._ALL_LETTERS
	for c in $Buttons.get_children():
		c.set("custom_colors/font_color", Color.WHITE_SMOKE)
