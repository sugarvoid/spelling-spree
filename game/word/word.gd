class_name WordDisplay
extends HBoxContainer

signal on_completion
signal is_in_word
signal not_in_word
signal after_checking

const BACKGROUND_GREEN: Texture = preload("res://game/letter_square_green.png")
const BACKGROUND_RED: Texture = preload("res://game/letter_square_red.png")
const BACKGROUND_GREY: Texture = preload("res://game/letter_square_grey.png")

const p_LetterBlock: PackedScene = preload("res://game/letter_block.tscn")


var word: Array = []
var letters_left: int 


func _ready() -> void:
	pass 

#func set_word(word: Array) -> void:
#	self.word = word

func _string_to_array(s: String) -> void:
	var array = []
	for c in s:
		array.append(c)
	print(array)
	## return array


func set_up_display(word: Array) -> void:
	_clear_old_word()
	self.word = word
	self.letters_left = word.size()
	for l in word.size():
		var new_letter = p_LetterBlock.instance()
		new_letter.connect("request_green", self, "_turn_letter_green")
		new_letter.letter = word[l]
		new_letter.set_label()
		self.add_child(new_letter)

func check_for_letter(letter: String) -> void: 	
	for i in range(0, self.word.size()):
		if self.word[i] == letter:
			letters_left -= 1
			self.emit_signal("after_checking", letter, true)
			self._reveal_letter(i, true)
		else:
			self.emit_signal("after_checking", letter, false)
	
	_check_completion()

func _clear_old_word() -> void:
	self.word = []


func _check_completion() -> void:
	if self.letters_left == 0:
		self.emit_signal("on_completion")
		print("word completed")

func _reveal_letter(child: int, correct: bool) -> void:
	var block: LetterBlock = self.get_child(child)
	block.show_label(correct)

func _turn_letter_green(block: LetterBlock) -> void:
	block.set_background(BACKGROUND_GREEN)
