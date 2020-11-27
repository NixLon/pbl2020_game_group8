extends RichTextLabel

var dialog = ["TEST SAMPLE 123 789 0"]
var page = 0

func _ready() -> void:
	set_bbcode(dialog[page])
	set_visible_characters(0)

func _on_Timer_timeout() -> void:
	set_visible_characters(get_visible_characters()+1)
