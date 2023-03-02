class_name LetterBlock
extends TextureRect

signal request_green
signal request_red

const WHITE: Rect2 =  Rect2(0,0,64,64)
const GREY: Rect2 =  Rect2(64,0,64,64)
const GREEN: Rect2 =  Rect2(128,0,64,64)
const RED: Rect2 =  Rect2(192,0,64,64)

var letter: String

func _ready() -> void:
	self.texture.set_region(GREY)
	self._hide_label()

func set_label() -> void:
	$Label.text = self.letter

func _hide_label() -> void:
	$Label.visible = false

func set_background(text: Texture2D) -> void:
	self.texture = text

func show_label(correct: bool) -> void:
	if correct:
		self.emit_signal("request_green", self)
	else:
		self.emit_signal("request_red", self)
	$Label.visible = true
