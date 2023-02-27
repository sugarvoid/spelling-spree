class_name WordDisplay
extends HBoxContainer

const p_LetterBlock: PackedScene = preload("res://game/letter_block.tscn")

var word_length: int 


func _ready() -> void:
	pass 


func set_word_length(n: int) -> void:
	self.word_length = n
	self._add_children()


func _add_children() -> void:
	for l in word_length:
		var new_letter = p_LetterBlock.instance()
		self.add_child(new_letter)
