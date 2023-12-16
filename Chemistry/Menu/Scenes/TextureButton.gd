extends TextureButton


@onready var animated_sprite := $AnimatedSprite2D

func _on_button_down():
	
	#animated_sprite.play("gas_gas")
	
	animated_sprite.play("gas_jidkost")
	
	#animated_sprite.play("jidkost_jidkost")
	
	#animated_sprite.play("jidkost_poroshok")


func _on_animated_sprite_2d_animation_looped():
	animated_sprite.stop()
