extends State

var actions: Array[ActionTemplate]
var len_actions: int = 0


func enter() -> void:
	#FOR DEBUG PURPOSES ONLY
	#var rootnode = get_parent().get_parent()
	#var temparr = [rootnode.find_child("Entity2")]
	#add_child(rootnode.find_child("Entity").get_child(0).construct(temparr[0], temparr))
	#END DEBUG CODE
	print("entered TurnQueue")
	
	for child in get_children():
		if child is Entity:
			actions.append(child)
	len_actions = len(actions)
	print(len_actions)


func exit() -> void:
	pass


var iterationPaused: bool = false
var i: int = 0

func update(_delta: float) -> void:
	if not iterationPaused:
		if i == len_actions:
			transition_to_next_state()
			return
		
		#actions[i].activate()
		
		i += 1
