extends TextureButton

signal was_pressed

const COLOR_GRAY: Color = Color.LIGHT_GRAY
const COLOR_BLACK: Color = Color.BLACK

var value: String = "w"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.connect("pressed", self._send_letter)
	
	self.value = self.get_name().to_lower()
	$Lbl_Letter.set_text(self.get_name())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _send_letter() -> void:
	emit_signal("was_pressed", self.value)
	print(self.get_name())
	# send letter to bank
	self.disable_button()


func disable_button() -> void:
	$Lbl_Letter.set("theme_override_colors/font_color", COLOR_GRAY)
	self.disabled = true


func enable_button() -> void:
	$Lbl_Letter.set("theme_override_colors/font_color", COLOR_BLACK)
	self.disabled = false
