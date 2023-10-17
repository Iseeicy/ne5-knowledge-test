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
	
	var tree_info: Dictionary = {}
	for know in all_knowledge.values():
		_create_tree_branch(
			tree_root,
			tree_info, 
			_remove_protocol_from_path(know.resource_path).split("/"),
			know
		)
		
func _on_knowledge_db_updated():
	update_tree()

func _remove_protocol_from_path(path: String) -> String:
	var index = path.find("://")
	if index < 0:
		return path
		
	return path.substr(index + 3)

func _create_tree_branch(parent_node: TreeItem, info: Dictionary, split_path: Array[String], knowledge: Knowledge) -> void:
	for x in range(1, split_path.size() + 1):
		var split_slice = split_path.slice(0, x)
		var path = "/".join(split_slice)
		
		# If a node already exists for this part of the subpath,
		# MOVE ON
		if path in info:
			parent_node = info[path]
			continue
			
		var new_node = create_item(parent_node)
		new_node.set_metadata(0, knowledge)
		info[path] = new_node
		
		var end_of_path = split_slice[-1]
		
		if '.' in end_of_path:
			end_of_path = end_of_path.split('.')[0]
			new_node.set_selectable(0, true)
			new_node.set_icon(0, preload("res://knowledge_icon.png"))
			new_node.set_icon_max_width(0, 32)
		else:
			new_node.set_selectable(0, false)
			
		new_node.set_text(0, end_of_path)
		parent_node = new_node
	
	
	
