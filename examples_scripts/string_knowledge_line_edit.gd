extends LineEdit

@export var knowledge: KnowledgeString

func _ready():
	knowledge.connect_updated_value(_on_knowledge_updated.bind())
	text = knowledge.get_value()

func _on_text_changed(new_text):
	knowledge.set_value(new_text)

func _on_knowledge_updated(new_value):
	text = new_value
