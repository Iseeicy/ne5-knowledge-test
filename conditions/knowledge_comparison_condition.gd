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

@export var knowledge_left: Knowledge = null
@export var comparison: ComparisonType = ComparisonType.Equals
@export var knowledge_right: Knowledge = null

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
