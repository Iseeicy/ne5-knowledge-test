extends Knowledge
class_name KnowledgeInteger

#
#	Exports
#

## The value of this knowledge, as an integer
@export var value: int:
	get:
		return _value
	set(new_value):
		_value = new_value

#
#	Public Functions
#

func get_value() -> int:
	return _value

func set_value(new_value: int) -> void:
	_value = new_value
