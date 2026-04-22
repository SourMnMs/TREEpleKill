extends Node
class_name StateMachine

@export var Inital_Node: State = null

var state: State = null
func _ready() -> void:
	state = Inital_Node if Inital_Node else get_child(0)
	
	# Connect each state's finished signal to the transition
	for stateNode: State in find_children("", "State"):
		stateNode.finished.connect(_to_next_state)


func _process(delta: float) -> void:
	if state:
		state.update(delta)


func _exit_state_machine() -> void:
	pass


func _to_next_state(next_state_path: String, _data: String) -> void:
	# Error-handling
	if not has_node(next_state_path):
		if next_state_path == "":
			print("WARNING::"+owner.name+"::Transition::No path found, exiting state machine")
			state.exit()
			_exit_state_machine()
		else:
			# owner refers to the thing emitting the signal
			printerr("ERROR::"+owner.name+"::Transition::Could not find target state: " + next_state_path)
		state = null
		return
	
	print(owner.name+"::Transition::" + next_state_path)
	state.exit()
	state = get_node(next_state_path)
	state.enter()
