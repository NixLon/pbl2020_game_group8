extends Control

var dialog = [
	'Dialog system is partially working, but the process if finicky AF',
	'Well son, it\'s time to say goodbye since...',
	'...this chat will just repeat the same line over and over -_-',
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()

func _process(delta):
	$"next-indicator".visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
	else:
		queue_free()
		get_tree().paused = false
		# Below is for debugging only; deleteable.
		print("Dialog_Mode = 0")
	dialog_index += 1


func _on_Tween_tween_completed(object, key):
	finished = true
