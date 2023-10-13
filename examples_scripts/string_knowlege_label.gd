extends Label

@export var knowledge: KnowledgeString

func _ready():
	knowledge.value_changed.connect(_on_knowledge_changed.bind())
	_on_knowledge_changed(knowledge.get_value())
	
func _on_knowledge_changed(new_value):
	text = new_value
