extends Control


var _game_letter_length: int


func _ready() -> void:
	pass 


func _set_game_word_length(letters: int) -> void:
	GameData.word_length_selection = letters
