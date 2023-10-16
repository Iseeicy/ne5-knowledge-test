extends Node
class_name KnowledgeAgent

#
#	Exports
#

## Called when the value of this knowledge is changed
signal value_changed(new_value)

## The knowledge to represent
@export var knowledge: Knowledge

#
#	Godot Functions
#

func _ready() -> void:
	knowledge.value_changed.connect(_on_knowledge_value_changed.bind())
	_on_knowledge_value_changed(knowledge.get_value())
	
#
#	Signals
#

func _on_knowledge_value_changed(new_value) -> void:
	value_changed.emit(new_value)
