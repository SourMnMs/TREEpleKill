extends Node
class_name ActionTemplate

@export var source: Entity
@export var targets: Array[Entity]

## How movable this action is. If it has 0 priority, it is immovable.
## If asked to moved by an action with a lower priority, it will move.
@export_range(0, 1000) var priority: float = 0

## [DO NOT OVERWRITE] Wrapper function, returns if the action actually happened or not.
func activate() -> bool:
	if source and len(targets) > 0:
		action()
		return true;
	return false

## [OVERWRITE THIS!] Actual function for the action.
func action() -> void:
	pass


static func construct() -> ActionTemplate:
	var act: ActionTemplate = ActionTemplate.new()
	return act
