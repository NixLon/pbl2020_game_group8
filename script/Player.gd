extends KinematicBody2D

const ACCELERATION = 800
const MAX_SPEED = 50
const FRICTION = 500
var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	add_to_group("Player")

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/IdleAnim/blend_position", input_vector)
		animationTree.set("parameters/WalkAnim/blend_position", input_vector)
		animationState.travel("WalkAnim")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	
	else:
		animationState.travel("IdleAnim")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	move_and_slide(velocity)

	move_and_collide(velocity * delta)
