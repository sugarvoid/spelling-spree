class_name WordDisplay
extends HBoxContainer

signal on_completion

const p_LetterBlock: PackedScene = preload("res://game/letter_block.tscn")


var word: Array = []


func _ready() -> void:
	pass 

func set_word(word: String) -> void:
	pass

func set_up_display(word: Array) -> void:
	_clear_old_word()
	self.word
	for l in word.size():
		var new_letter = p_LetterBlock.instance()
		new_letter.letter = word[l]
		new_letter.set_label()
		self.add_child(new_letter)

func _check_for_letter(letter: String) -> void: 
	var test_word: Array = ["h", "o", "t", "d", "o", "g"]
	
	self.set_up_display(test_word)
	
	for i in range(0, test_word.size()):
		if test_word[i] == "o":
			# Word Display reveal letter
			pass

func _clear_old_word() -> void:
	self.word = []
