extends Area2D

var can_interact = false
var timer = false
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
