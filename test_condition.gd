extends TextureRect

@export var condition: KnowledgeCondition

func _process(_delta):
	if condition == null:
		return
		
	visible = condition.evaluate()
