extends Node
class_name State
## Overridable functions: [method State.enter], [method State.exit], [method State.update]

signal finished(next_state_path: String, data: String)


## Leave null to indicate this state as a stop-state.
@export var nextState: State = null


func enter() -> void:
	pass


func exit() -> void:
	pass


## The state defaults to a "one and done."
func update(_delta: float) -> void:
	transition_to_next_state()


## [b][DO NOT OVERWRITE!][/b] Call when ready to transition states. It is advised
## to return whatever function immediately after.
## [br][br]
## [param alternateStateName] can be left blank unless the transition is to a
## state other than [member State.nextState]
func transition_to_next_state(alternateStateName: String = "") -> void:
	if alternateStateName:
		finished.emit(alternateStateName, "")
	finished.emit("" if not nextState else str(nextState.name), "")
