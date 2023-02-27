extends Control


const ALL_LETTERS: Array = [
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
	]


var word_length: int
var avilible_letter: Array 
var current_word: String
var current_word_array: Array


func _ready() -> void:
	self._load_letter_array()




func _load_letter_array() -> void:
	self.avilible_letter.empty()
	self.avilible_letter = self.ALL_LETTERS
