extends GridContainer



func _ready() -> void:
	highlight_letter("a", Color.red)
	highlight_letter("f", Color.red)
	highlight_letter("p", Color.red)


func highlight_letter(letter: String, color: Color) -> void:
	var lbl_letter: Label = get_node(letter.to_upper())
	lbl_letter.set("custom_colors/font_color", color)
