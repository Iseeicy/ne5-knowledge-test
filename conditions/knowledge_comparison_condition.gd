@tool
extends KnowledgeCondition
class_name KnowledgeComparisonCondition

#
#	Enums
#

enum ComparisonType {
	Equals,
	NotEquals,
	GreaterThan,
	GreaterThanOrEqualsTo,
	LessThan,
	LessThanOrEqualsTo
}

#
#	Exports
#

@export var knowledge_left: Knowledge:
	get:
		return _knowledge_left
	set(new_knowledge):
		print("Hello from ", resource_path)
		if _knowledge_left != null:
			_knowledge_left.disconnect_updated_value(_on_knowledge_value_changed)
		if new_knowledge != null:
			new_knowledge.connect_updated_value(_on_knowledge_value_changed)
		_knowledge_left = new_knowledge
	
@export var comparison: ComparisonType = ComparisonType.Equals

@export var knowledge_right: Knowledge:
	get:
		return _knowledge_right
	set(new_knowledge):
		if _knowledge_right != null:
			_knowledge_right.disconnect_updated_value(_on_knowledge_value_changed)
		if new_knowledge != null:
			new_knowledge.connect_updated_value(_on_knowledge_value_changed)
		_knowledge_right = new_knowledge

#
#	Private Values
#

var _knowledge_left: Knowledge = null
var _knowledge_right: Knowledge = null

#
#	Condition Functions
#

func evaluate() -> bool:
	if knowledge_left == null or knowledge_right == null:
		return false
	
	# Use the given comparison type to apply actual operators
	match comparison:
		ComparisonType.Equals:
			return knowledge_left.get_value() == knowledge_right.get_value()
		ComparisonType.NotEquals:
			return knowledge_left.get_value() != knowledge_right.get_value()
		ComparisonType.GreaterThan:
			return knowledge_left.get_value() > knowledge_right.get_value()
		ComparisonType.GreaterThanOrEqualsTo:
			return knowledge_left.get_value() >= knowledge_right.get_value()
		ComparisonType.LessThan:
			return knowledge_left.get_value() < knowledge_right.get_value()
		ComparisonType.LessThanOrEqualsTo:
			return knowledge_left.get_value() <= knowledge_right.get_value()
	
	return false

#
#	Signals
#

## Whenever one of our assigned knowledges has it's value updated, re-calculate 
## OUR value
func _on_knowledge_value_changed(_unused) -> void:
	self.recalculate_value()
