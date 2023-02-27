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
var current_word: String
var current_word_array: Array


func _ready() -> void:
	self._load_letter_array()
	self._connect_signals()

func _connect_signals() -> void:
	input_checker.connect("letter_pressed", self, "_on_letter_pressed")

func _on_letter_pressed(letter: String) -> void:
	print(letter)

func _load_letter_array() -> void:
	self.avilible_letter.empty()
	self.avilible_letter = self.ALL_LETTERS
