extends Control
@onready var animPortal = $AnimsContainer/Portal
@onready var bgMage =$PanelColorBGMage
@onready var bgArch =$PanelColorBGArcher
@onready var bgKnigh =$PanelColorBGKnight
func _ready():
	animPortal.play("Portal")




func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn");


func _on_select_button_pressed():
	GlobalSettingsSet.MenuBGM.stop()
	GlobalSettingsSet.City01BGM.play()
	get_tree().change_scene_to_file("res://Levels/Gamelvl.tscn");



func _on_panel_color_bg_mage_mouse_entered():
	print("asd")
	


func _on_panel_color_bg_archer_mouse_entered():
	pass # Replace with function body.


func _on_panel_color_bg_knight_mouse_entered():
	pass # Replace with function body.


func _on_area_2d_mouse_entered():
	animPortal.stop()
	animPortal.play("PortalHover")


func _on_area_2d_mouse_exited():
	animPortal.stop()
	animPortal.play("Portal")


func _on_area_2d_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
			GlobalSettingsSet.MenuBGM.stop()
			GlobalSettingsSet.City01BGM.play()
			get_tree().change_scene_to_file("res://Levels/Gamelvl.tscn");
