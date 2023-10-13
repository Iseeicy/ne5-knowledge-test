extends Knowledge
class_name KnowledgeFloat

#
#	Exports
#

## The value of this knowledge, as a float
@export var value: float:
	get:
		return _value
	set(new_value):
		_value = new_value

#
#	Public Functions
#

func get_value() -> float:
	return _value

func set_value(new_value: float) -> void:
	_value = new_value
