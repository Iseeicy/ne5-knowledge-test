@tool
extends Resource
class_name KnowledgeCondition

#
#	Virtual Functions
#

## Run this condition and see if it's true or false.
## This is meant to be extended!
func evaluate() -> bool:
	return false
