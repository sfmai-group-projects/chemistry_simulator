extends TextureButton
var global = load("res://GlobalValue.gd").new

@onready var animated_sprite := $AnimatedSprite2D
func _on_button_down():
	#animated_sprite.set_frame_and_progress(1,0.0)
	animated_sprite.show()
	match int(GlobalValue.global_num):
		1:			
			animated_sprite.speed_scale = 1
			animated_sprite.play("gas_gas")
		2:
			animated_sprite.speed_scale = 1
			animated_sprite.play("gas_jidkost")
		3:
			animated_sprite.speed_scale = 1
			animated_sprite.play("jidkost_jidkost")
		4:
			animated_sprite.speed_scale = 1
			animated_sprite.play("jidkost_poroshok")
		5:
			animated_sprite.play("gas_jidkost")
		_:
			animated_sprite.visible = false
			animated_sprite.speed_scale = 10
			animated_sprite.play("gas_jidkost")

func _on_animated_sprite_2d_animation_looped():
	animated_sprite.stop()
