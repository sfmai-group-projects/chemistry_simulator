extends Node
var global_num

func get_num(x):
	global_num = x
	print(str(global_num))

func set_num(x):
	x = global_num
	print(str(global_num))
	return int(x)
