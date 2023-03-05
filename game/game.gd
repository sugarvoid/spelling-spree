class_name LetterButton
extends Control


const ALL_LETTERS: Array = [
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
	]

@onready var word_database: WordDatabase = get_node("WordDatabase")
@onready var word_display: WordDisplay = get_node("WordDisplay")
@onready var input_checker: InputChecker = get_node("InputChecker")
@onready var letter_bank: LetterBank = get_node("LetterBank")
@onready var count_down: CountDown = get_node("CountDown")

var word_length: int
var avilible_letter: Array 
var current_word: String = "hotdog"
var current_word_array: Array 
var game_round: int 


func _ready() -> void:
	self.count_down.mode = CountDown.MODES.COUNT_DOWN
	self.count_down.start()
	self._load_letter_array()
	self._connect_signals()
	self._set_new_word()



func _connect_signals() -> void:
	input_checker.connect("letter_pressed",Callable(self,"_on_letter_typed"))
	letter_bank.connect("on_letter_pressed",Callable(self,"_on_letter_pressed"))
	word_display.connect("after_checking",Callable(self.letter_bank,"update_letters"))
	word_display.connect("on_completion",Callable(self,"_end_round"))

func _on_letter_typed(letter: String) -> void:
	print("letter typed")
	# Check if word display has letter
	self.word_display.check_for_letter(letter)
	####self.letter_bank.update_letters(letter, true)

func _on_letter_pressed(letter: String) -> void:
	print("letter clicked")
	# Check if word display has letter
	self.word_display.check_for_letter(letter)
	####self.letter_bank.update_letters(letter, true)

func _load_letter_array() -> void:
	self.avilible_letter.is_empty()
	self.avilible_letter = self.ALL_LETTERS

func _set_new_word() -> void:
	self.current_word_array = word_database.get_word(6)
	self.word_display.set_up_display(self.current_word_array)
	
func _start_round() -> void:
	self.letter_bank.reset()
	self.game_round += 1
	_set_new_word()

func _update_letter_bank() -> void:
	pass

func _end_round() -> void:
	pass 
	print("start next round")

