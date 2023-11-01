extends CharacterBody2D

@export var movement_speed : float = 100
@export var starting_direction : Vector2 = Vector2(0, -1)

@onready var CharSprite = $Sprite2D
@onready var Char = $"."
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	
	animation_tree.set("parameters/Idle/blend_position",  starting_direction)

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	update_anim_param(input_direction)
	
	velocity = input_direction *  movement_speed
	
	move_and_slide()
	pick_new_state()

	look_at(get_global_mouse_position())
	print(Char.rotation_degrees)
	CharSprite.set_flip_v(Char.rotation_degrees>60)
	CharSprite.set_flip_h(Char.rotation_degrees>60)



func update_anim_param(move_input : Vector2):
	if (move_input != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", move_input)
		animation_tree.set("parameters/Idle/blend_position", move_input)

func pick_new_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
