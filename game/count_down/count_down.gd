class_name CountDown
extends Control



@onready var label: Label = get_node("Label")
@onready var timer: Timer = get_node("Timer")

enum MODES {
	COUNT_UP,
	COUNT_DOWN
}

var mode: int
var is_running: bool
var _elapsed: float = 60.00

func _ready() -> void:
	timer.connect("timeout",Callable(self,"_tick"))

func _process(delta):
	if(self.is_running):
		self.update_time(delta)
	self.label.text = self.seconds2hhmmss(_elapsed)

func _tick() -> void:
	print("tick")

func update_time(delta: float) -> void:
	match self.mode:
		MODES.COUNT_DOWN:
			self._elapsed -= delta
		MODES.COUNT_UP:
			self._elapsed += delta

func stop() -> void:
	self.is_running = false
	
func start() -> void:
	timer.start()
	self.is_running = true
	
func get_time_elaspsed() -> float:
	return self._elapsed

func get_elaspsed_string() -> String:
	return self.seconds2hhmmss(self._elapsed)

func reset() -> void:
	self._elapsed = 60
	self.is_running = false

func seconds2hhmmss(total_seconds: float) -> String:
	var seconds: float = fmod(total_seconds , 60.0)
	var minutes: int   =  int(total_seconds / 60.0) % 60
	var hours: int   =  int(total_seconds / 3600.0)
	var hhmmss_string:String = "%02d:%02d" % [minutes, seconds]
	return hhmmss_string
