extends Node

#
#	Exports
#

signal updated()
signal knowledge_registered(knowledge: Knowledge)
signal knowledge_unregistered(knowledge: Knowledge)

#
#	Variables
#

var _all_knowledge: Dictionary = {}

#
#	Public Functions
#

func register_knowledge(know: Knowledge) -> void:
	if know.resource_path in _all_knowledge:
		unregister_knowledge(know)
	
	_all_knowledge[know.resource_path] = know
	knowledge_registered.emit(know)
	updated.emit()
	
func unregister_knowledge(know: Knowledge) -> bool:
	var did_unregister = _all_knowledge.erase(know.resource_path)
	if did_unregister:
		knowledge_unregistered.emit(know)
		updated.emit()
		
	return did_unregister

func get_all() -> Dictionary:
	return _all_knowledge

func save_state() -> void:
	var save_file = FileAccess.open("user://save_state.bin", FileAccess.WRITE)
	
	for key in _all_knowledge:
		save_file.store_var(key)					# Store dict key
		save_file.store_var(_all_knowledge[key])	# Store dict val
	
	
func load_state() -> void:
	if not FileAccess.file_exists("user://save_state.bin"):
		return # Error! We don't have a save to load.
		
	var new_all_knowledge: Dictionary = {}
	var save_file = FileAccess.open("user://save_state.bin", FileAccess.READ)
	
	while save_file.get_position() < save_file.get_length():
		var found_key = save_file.get_var()
		var found_val = save_file.get_var()
		new_all_knowledge[found_key] = found_val

	_all_knowledge = new_all_knowledge
