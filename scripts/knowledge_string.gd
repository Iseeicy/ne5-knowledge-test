extends Knowledge
class_name KnowledgeString

#
#	Exports
#

## The value of this knowledge, as a String
@export var value: String:
	get:
		if _value == null:
			return ""
		else:
			return _value
	set(new_value):
		_value = new_value

#
#	Public Functions
#

func get_value() -> String:
	return value

func set_value(new_value: String) -> void:
	value = new_value
