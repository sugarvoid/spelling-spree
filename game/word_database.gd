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

func _string_to_array(s: String) -> Array:
	var array = []
	for c in s:
		array.append(c)
	return array

func get_word(length: int) -> Array:
	match length:
		5:
			return _string_to_array("match")
		6:
			return _string_to_array("hotdog")
		7:
			return _string_to_array("hotdogs")
		_:
			return []
