extends Tree

func _enter_tree():
	KnowledgeDB.updated.connect(_on_knowledge_db_updated.bind())
	
func _exit_tree():
	KnowledgeDB.updated.disconnect(_on_knowledge_db_updated.bind())
	
func update_tree():
	clear()
	var tree_root = create_item()
	tree_root.set_text(0, "All Knowledge")
	
	var all_knowledge = KnowledgeDB.get_all()
	print(all_knowledge.size())
	
	for know in all_knowledge.values():
		var tree_item = create_item(tree_root)
		tree_item.set_text(0, know.resource_path)
		
func _on_knowledge_db_updated():
	update_tree()
