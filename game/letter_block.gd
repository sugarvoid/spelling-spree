class_name LetterBlock
extends TextureRect


const WHITE: Rect2 =  Rect2(0,0,64,64)
const GREY: Rect2 =  Rect2(64,0,64,64)
const GREEN: Rect2 =  Rect2(128,0,64,64)
const RED: Rect2 =  Rect2(192,0,64,64)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.texture.set_region(WHITE)



