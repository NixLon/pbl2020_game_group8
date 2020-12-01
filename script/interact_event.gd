extends Area2D

var velocity = Vector2()
var can_interact = false
var timer = false
var DialogNode = load("res://scenes/Dialog.tscn")
onready var animationPlayer = $AnimationPlayer

func _on_NPC_Interact_body_exited(body: Node) -> void:
	if body.is_in_group("Player"):
		animationPlayer.play("TalkExit")
		$Timer.wait_time = 0.1
		$Timer.start()
		timer = true
		can_interact = false
		# Below is for debugging only; deleteable.
		print("Entered_NPC = 0")

func _on_NPC_Interact_body_entered(body: Node) -> void:
		if body.is_in_group("Player"):
			animationPlayer.play("TalkEnter")
			$Sprite.show()
			can_interact= true
			# Below is for debugging only; deleteable.
			print("Entered_NPC = 1")


func _on_Timer_timeout() -> void:
	if timer == true:
		$Sprite.hide()
		timer = false

func _input(event):
	if Input.is_action_just_pressed("ui_accept") and can_interact == true:
		var d = DialogNode.instance()
		get_parent().add_child(d)
		d.rect_position = Vector2(40, 110)
		get_tree().paused = true
		# Below is for debugging only; deleteable.
		print("Dialog_Mode = 1")
		
