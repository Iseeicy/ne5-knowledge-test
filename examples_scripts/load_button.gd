extends Button

func _on_pressed():
	KnowledgeDB.load_state("user://save_state.bin")
