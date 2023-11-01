extends Node
###
#
#
# SETTINGS #
var isFullscreenAfterSetting=false
var ResAfterSetting=Vector2(800,600)
var Scl=1
var config = ConfigFile.new()
#
#
###
###
#
#
#BGM MUSIC BGM#
@onready var MenuBGM = MenuBgm
@onready var City01BGM = City01Bgm


#
###
#
func LoadSettings():
	var err = config.load("res://cfg/setting.cfg")
	if err != OK:
		return
	for setting in config.get_sections():
	# Fetch the data for each section.
		ResAfterSetting = config.get_value(setting, "Res")
		isFullscreenAfterSetting = config.get_value(setting, "win")
		Scl =config.get_value(setting, "Scl") 
#
func _ready():
	LoadSettings();
	get_viewport().size = GlobalSettingsSet.ResAfterSetting
	get_tree().root.content_scale_factor=Scl
	if GlobalSettingsSet.isFullscreenAfterSetting == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN);
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED);
