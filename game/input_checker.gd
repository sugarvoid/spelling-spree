extends Node



signal letter_pressed

const LETTERS: Array = [
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
	]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_string_to_array("this")

func _string_to_array(s: String) -> void:
	var array = []
	for c in s:
		array.append(c)
	print(array)
	## return array

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed(): 
		var key_typed = OS.get_scancode_string(event.scancode).to_lower()
		if LETTERS.has(key_typed):
			print(str("Letter[", key_typed, "] was pressed."))
		# print(key_typed.to_lower())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
