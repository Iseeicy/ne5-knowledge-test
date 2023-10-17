extends Label

@export var tree: Tree
var _current_knowledge: Knowledge = null

func _on_knowledge_dock_tree_item_selected():
	_current_knowledge = tree.get_selected().get_metadata(0) as Knowledge

func _process(delta):
	if _current_knowledge == null:
		return
		
	text = str(_current_knowledge.get_value())
	
