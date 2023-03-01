extends Control


const ALL_LETTERS: Array = [
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
	]

onready var word_database: WordDatabase = get_node("WordDatabase")
onready var word_display: WordDisplay = get_node("WordDisplay")
onready var input_checker: InputChecker = get_node("InputChecker")
onready var letter_bank: LetterBank = get_node("LetterBank")

var word_length: int
var avilible_letter: Array 
var current_word: String = "hotdog"
var current_word_array: Array = ["h", "o", "t", "d", "o", "g"]
var game_round: int 


func _ready() -> void:
	self._load_letter_array()
	self._connect_signals()



func _connect_signals() -> void:
	input_checker.connect("letter_pressed", self, "_on_letter_pressed")

func _on_letter_pressed(letter: String) -> void:
	# Check if word display has letter
	print(letter)
	self.letter_bank.update_letters(letter, true)

func _load_letter_array() -> void:
	self.avilible_letter.empty()
	self.avilible_letter = self.ALL_LETTERS

func _set_new_word() -> void:
	self.current_word = word_database.get_word(3)
	
func _start_round() -> void:
	self.game_round += 1
	_set_new_word()

func _update_letter_bank() -> void:
	pass


