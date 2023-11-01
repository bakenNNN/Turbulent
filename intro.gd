extends Node2D

@onready var animp = $AnimationPlayer
@onready var dinnye = $AnimatedSprite2D
@onready var portalfx = $portalfx
@onready var thunder = $thunder
@onready var nya = $nya
func _ready():
	set_process_input(true)
	animp.play("Fade in black")
	await get_tree().create_timer(4).timeout
	dinnye.play("default")
	portalfx.play()
	await get_tree().create_timer(4).timeout
	thunder.play()
	animp.play("fadeinWhite")
	await get_tree().create_timer(1).timeout
	nya.play()
	await get_tree().create_timer(6).timeout
	animp.play("Fade out blac")
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://menu.tscn")

func _input(ev):
	if Input.is_key_pressed(KEY_SPACE):
		get_tree().change_scene_to_file("res://menu.tscn")
