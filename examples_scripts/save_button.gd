extends Button

func _on_pressed():
	KnowledgeDB.save_state("user://save_state.bin")
