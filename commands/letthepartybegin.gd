extends Command

const GOOMBA_PARTY_SPAWNER = preload("res://objects/goomba_party_spawner/goomba_party_spawner.tscn")
const SCENE_PATHS: Array[StringName] = [
	&"human_lab",
	&"level_ny_",
	&"_u/hidden/extralevel_2",
	&"_u/hidden/extralevel_3",
	&"MisiekMomento",
	&"human_lava_run",
]

static func register() -> Command:
	return new().set_name("letthepartybegin").set_description("Make every level a Goomba Party!!!")

func execute(args:Array) -> Command.ExecuteResult:
	if !Scenes.scene_ready.is_connected(patch_level):
		Thunder._connect(Scenes.scene_ready, patch_level)
		patch_level()
		return Command.ExecuteResult.new("Let the Party begin! (Run this command again to disable)")
	else:
		Thunder._disconnect(Scenes.scene_ready, patch_level)
		if Scenes.is_inside_tree():
			for i in Scenes.get_tree().get_nodes_in_group(&"the_goomba_spawner"):
				i.queue_free()
		return Command.ExecuteResult.new("Party Over!")
		

func patch_level() -> void:
	if !Scenes.is_inside_tree() || !Scenes.current_scene is Level:
		return
	if Scenes.get_tree().get_node_count_in_group(&"the_goomba_spawner") > 0:
		return
	var spawner = GOOMBA_PARTY_SPAWNER.instantiate()
	var scene_path: String = Scenes.current_scene.scene_file_path
	if SCENE_PATHS.any(func(path: StringName):
		return path in scene_path
	):
		spawner.spawned_enemy = preload("res://objects/human_lab_2/ramireys/goomba_clone/goomba_clone.tscn")
	Scenes.current_scene.add_child(spawner)
