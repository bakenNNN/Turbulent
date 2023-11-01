extends Control
@onready var resOptionButton = $HBoxContainer/ResolutionButton
@onready var winOptionButton = $HBoxContainer2/CheckButton
@onready var SliderButton=$VBoxContainer/Slider
var checkbutt
func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
	GlobalSettingsSet.config.save("res://cfg/setting.cfg")

var Resolutions: Dictionary=  {
								str("Current: "+ str(GlobalSettingsSet.ResAfterSetting)):GlobalSettingsSet.ResAfterSetting,
								"1920x1080":Vector2(1920,1080),
								"1366x768":Vector2(1366,768),
								"1536x864":Vector2(1536,864),
								"1280x720":Vector2(1280,720),
								"1440x900":Vector2(1440,900),
								"1600x900":Vector2(1600,900),
								"1024x600":Vector2(1024,600),
								"800x600":Vector2(800,600)
	
}
var isItWindowed: Dictionary={
								str("Current: " + str(GlobalSettingsSet.isFullscreenAfterSetting)):GlobalSettingsSet.isFullscreenAfterSetting,
								"Yes":true,
								"No":false
}
func _ready(): 

	AddResolutions();
	if GlobalSettingsSet.Scl==1:
		SliderButton.value=1;
	if GlobalSettingsSet.Scl==2:
		SliderButton.value=2;
	if GlobalSettingsSet.Scl==3:
		SliderButton.value=3;

func AddResolutions():
	for r in Resolutions:
		resOptionButton.add_item(r);
	for o in isItWindowed:
		winOptionButton.add_item(o);


func _on_resolution_button_item_selected(index):
	var Ressize = Resolutions.get(resOptionButton.get_item_text(index));
	get_viewport().size = Ressize
	GlobalSettingsSet.config.set_value("Settings","Res", Ressize)
	
	



func _on_check_button_item_selected(index):
	var Windowede = isItWindowed.get(winOptionButton.get_item_text(index));
	if Windowede == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN);
		GlobalSettingsSet.config.set_value("Settings","win", Windowede)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);
		GlobalSettingsSet.config.set_value("Settings","win", Windowede)


func _on_slider_value_changed(value):

	if value == 1:
		get_tree().root.content_scale_factor=1
		GlobalSettingsSet.config.set_value("Settings","Scl", 1)
	if value ==2:
		get_tree().root.content_scale_factor=2
		GlobalSettingsSet.config.set_value("Settings","Scl", 2)
	if value ==3:
		get_tree().root.content_scale_factor=3
		GlobalSettingsSet.config.set_value("Settings","Scl", 3)

