extends Control


var _game_letter_length: int


func _ready() -> void:
	pass 




func _set_game_word_length() -> void:
	GameData.word_length_selection = self._game_letter_length
