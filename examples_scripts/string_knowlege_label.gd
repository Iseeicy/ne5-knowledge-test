extends Label

@export var knowledge: KnowledgeString

func _ready():
	knowledge.connect_updated_value(_on_knowledge_changed.bind())
	_on_knowledge_changed(knowledge.get_value())
	
func _on_knowledge_changed(new_value):
	text = new_value
