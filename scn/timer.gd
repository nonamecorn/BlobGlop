extends Label

signal timeout

@export var time : float
@export var number_of_parts : int

func _ready() -> void:
	number_of_parts += int(Global.xp / 100)

var current_time = time
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if number_of_parts == 0: return
	if current_time > 0:
		current_time -= delta
		text = str(snapped(current_time,0.01))
	else:
		randomize_time()

func randomize_time():
	number_of_parts -= 1
	timeout.emit()
	current_time = time
