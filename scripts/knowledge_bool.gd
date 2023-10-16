extends Knowledge
class_name KnowledgeBool

#
#	Exports
#

## The value of this knowledge, as a bool
@export var value: bool:
	get:
		return _value
	set(new_value):
		_value = new_value

#
#	Public Functions
#

func get_value() -> bool:
	return value

func set_value(new_value: bool) -> void:
	value = new_value
