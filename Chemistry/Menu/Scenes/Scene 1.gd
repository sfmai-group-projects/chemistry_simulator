extends Control





func _on_back_button_down():
	get_tree().change_scene_to_file("res://Menu/Scenes/Menu.tscn")


func _on_custom_button_down():
	get_tree().change_scene_to_file("res://Menu/Scenes/Game.tscn")
