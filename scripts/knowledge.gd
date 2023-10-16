extends Resource
class_name Knowledge

#
#	Exports
#

signal value_changed(new_value)

#
#	Variables
#

var __internal_value
var _value:
	get:
		return __internal_value
	set(new_value):
		__internal_value = new_value
		value_changed.emit(new_value)
		
#
#	Godot Functions
#

func _init():
	call_deferred("_setup")

#
#	Public Functions
#

func get_value():
	return _value
	
func set_value(new_value):
	_value = new_value

#
#	Private Functions
#

func _setup():
	print("Yo! ", resource_path)
	KnowledgeDB.register_knowledge(self)


