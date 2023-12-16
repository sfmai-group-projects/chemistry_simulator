extends Control

@onready var cont := $PacHomeMolecules3



func _on_back_button_down():
	get_tree().change_scene_to_file("res://Menu/Scenes/Menu.tscn")



func _on_custom_button_down():
	$Timer.start()
	cont.show()


func _on_trial_button_down():
	get_tree().change_scene_to_file("res://Menu/Scenes/test.tscn")


func _on_ready():
	cont.hide()


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Menu/Scenes/Game.tscn")

