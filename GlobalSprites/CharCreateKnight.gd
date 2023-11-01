extends AnimatedSprite2D
@onready var Anim = $"."

func _on_area_2d_mouse_entered():
	pass


func _on_area_2d_input_event(viewport, event, shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:

		Anim.play("Selected")
		await Anim.animation_finished
		Anim.play("Idle")




func _on_area_2d_mouse_exited():
	pass

