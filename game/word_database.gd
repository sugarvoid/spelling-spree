class_name WordDatabase
extends Node


const WORD_4: Array = [
	"bear",
	"cash",
	"gore",
	"land",
	"ride"
]

const WORD_5: Array = [
	"eight",
	"spice",
	"anvil",
	"choke",
	"faint"
]

const WORD_6: Array = [
	"almond",
	"groove",
	"island",
	"motion",
	"strike"
]


func _ready() -> void:
	pass 

func get_word(length: int) -> String:
	match length:
		4:
			return "play"
		5:
			return "match"
		6:
			return "branch"
		_:
			return ""
