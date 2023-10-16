extends Knowledge
class_name KnowledgeInteger

#
#	Exports
#

## The value of this knowledge, as an integer
@export var value: int:
	get:
		if _value == null:
			return 0
		else:
			return _value
	set(new_value):
		_value = new_value

#
#	Public Functions
#

func get_value() -> int:
	return value

func set_value(new_value: int) -> void:
	value = new_value
