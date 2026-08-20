extends Control

const SHADER_OPTIMIZER = preload("res://engine/components/shader_optimizer/shader_optimizer.tscn")
const TWEAK_PRESETS = preload("res://stages/intro/tweak_presets.tscn")

@onready var disclaimer: TextureRect = $CenterContainer/TextureRect
@onready var icon: TextureRect = $CenterContainer/Icon
@onready var text: Label = $Text

var loading_finished: bool = false
var cacher

func _ready() -> void:
	SettingsManager.enable_shortcut_scene_change_keys = false
	print("[Startup] Game Version %s" % [ProjectSettings.get_setting("application/config/version")])
	print("[Startup] Preparing to compile shaders...")
	if "--no-shader-precompile" in OS.get_cmdline_user_args():
		print("[Startup] Found a flag in cmdline arguments, skipping compilation.")
		display_disclaimer()
		return
		
	await get_tree().create_timer(0.6, false, true, false).timeout
	print("[Startup] Compiling shaders...")
	cacher = SHADER_OPTIMIZER.instantiate()
	cacher.complete.connect(display_disclaimer)
	Scenes.current_scene.add_child(cacher)
	Thunder.reorder_top(cacher)


func display_disclaimer() -> void:
	print("[Startup] Shader compilation complete!")
	text.queue_free()
	icon.queue_free()
	if is_instance_valid(cacher):
		cacher.hide()
		cacher.queue_free()
	
	var tw = disclaimer.create_tween()
	tw.tween_property(disclaimer, "modulate:a", 1.0, 0.6)
	tw.tween_interval(2.2)
	tw.tween_property(disclaimer, "modulate:a", 0.0, 0.6)
	tw.tween_callback(init_tweak_selections)
	await get_tree().physics_frame
	SettingsManager.enable_shortcut_scene_change_keys = true


func init_tweak_selections() -> void:
	if !SettingsManager.tweaks.is_empty():
		transition()
		return
	
	var chooser = TWEAK_PRESETS.instantiate()
	chooser.modulate.a = 0
	add_child(chooser)
	var tw = chooser.create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	tw.tween_property(chooser, "modulate:a", 1.0, 0.5)
	


func transition() -> void:
	var _crossfade: bool = SettingsManager.get_tweak("replace_circle_transitions_with_fades", false)
	var mainmenu = ProjectSettings.get_setting("application/thunder_settings/main_menu_path")
	if !_crossfade:
		TransitionManager.accept_transition(
			load("res://engine/components/transitions/circle_transition/circle_transition.tscn")
				.instantiate()
				.with_speeds(0.04, -0.1)
				.with_pause()
		)

		await TransitionManager.transition_middle
		TransitionManager.current_transition.queue_free()
		Scenes.goto_scene(mainmenu)
	else:
		Scenes.goto_scene(mainmenu)
