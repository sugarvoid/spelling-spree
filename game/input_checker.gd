class_name InputChecker
extends Node



signal letter_pressed

const LETTERS: Array = [
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
	]



func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and !event.is_pressed(): 
		var key_typed = OS.get_scancode_string(event.scancode).to_lower()
		if LETTERS.has(key_typed):
			self.emit_signal("letter_pressed", key_typed)
			print(str("Letter[", key_typed, "] was pressed."))
		# print(key_typed.to_lower())


