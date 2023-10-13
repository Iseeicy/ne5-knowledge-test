extends LineEdit

@export var knowledge: KnowledgeString

func _ready():
	text = knowledge.value

func _on_text_changed(new_text):
	knowledge.set_value(new_text)
