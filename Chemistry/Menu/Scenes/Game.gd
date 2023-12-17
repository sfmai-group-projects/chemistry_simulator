extends Node
@onready var cont := $PacHomeMolecules2/PanelContainer
var db
var db_name="res://database/chemBase.sqlite"

var mix_button = null
var info_compoud_lable = null
var number_animation = null

var panel_r = null
var panel_solid_r = null
var panel_liquid_r = null
var panel_gas_r = null
var animated_sprite = null
var buttonsRight_solid = []
var buttonsRight_liquid = []
var buttonsRight_gas = []
var info_r = null
var info_r_testure = null
var info_r_lable = null

var panel_l = null
var panel_solid_l = null
var panel_liquid_l = null
var panel_gas_l = null
var buttonsLeft_solid = []
var buttonsLeft_liquid = []
var buttonsLeft_gas = []
var info_l = null
var info_l_testure = null
var info_l_lable = null

var matter1 = null;
var matter2 = null;

func _ready() ->void:
	db = SQLite.new()
	db.path=db_name
	connect_db()
	
	mix_button = $PacHomeMolecules2/TextureButton
	mix_button.disabled = true
	info_compoud_lable = $PacHomeMolecules2/PanelContainer/Button/Label
	panel_r = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/Matter2/MatterRight
	panel_solid_r = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/Matter2/MatterRight/RightBack/SolidLayerR
	panel_liquid_r = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/Matter2/MatterRight/RightBack/LiquidLayerR
	panel_gas_r = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/Matter2/MatterRight/RightBack/GasLayerR
	animated_sprite = $PacHomeMolecules2/TextureButton/AnimatedSprite2D
	info_r = $PacHomeMolecules2/ControlInfoR
	info_r_testure = $PacHomeMolecules2/ControlInfoR/TextureInfo
	info_r_lable = $PacHomeMolecules2/ControlInfoR/LableInfo
		
	panel_r.visible = false
	panel_solid_r.visible = false
	panel_liquid_r.visible = false
	panel_gas_r.visible = false
	cont.visible = false
	panel_l = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Left/Matter1/MatterLeft
	panel_solid_l = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Left/Matter1/MatterLeft/LeftBack/SolidLayerL
	panel_liquid_l = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Left/Matter1/MatterLeft/LeftBack/LiquidLayerL
	panel_gas_l = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Left/Matter1/MatterLeft/LeftBack/GasLayerL
	info_l = $PacHomeMolecules2/ControlInfoL
	info_l_testure = $PacHomeMolecules2/ControlInfoL/TextureInfo
	info_l_lable = $PacHomeMolecules2/ControlInfoL/LableInfo
	
	panel_l.visible = false
	panel_solid_l.visible = false
	panel_liquid_l.visible = false
	panel_gas_l.visible = false
	
	read_elements_solid_r()
	for btn in buttonsRight_solid:
		btn.pressed.connect(button_action_right_solid.bind(btn))
		btn.mouse_entered.connect(button_entered_right_solid.bind(btn))
	read_elements_liquid_r()
	for btn in buttonsRight_liquid:
		btn.pressed.connect(button_action_right_liquid.bind(btn))
		btn.mouse_entered.connect(button_entered_right_liquid.bind(btn))
	read_elements_gas_r()
	for btn in buttonsRight_gas:
		btn.pressed.connect(button_action_right_gas.bind(btn))
		btn.mouse_entered.connect(button_entered_right_gas.bind(btn))
	
	read_elements_solid_l()
	for btn in buttonsLeft_solid:
		btn.pressed.connect(button_action_left_solid.bind(btn))
		btn.mouse_entered.connect(button_entered_left_solid.bind(btn))
	read_elements_liquid_l()
	for btn in buttonsLeft_liquid:
		btn.pressed.connect(button_action_left_liquid.bind(btn))
		btn.mouse_entered.connect(button_entered_left_liquid.bind(btn))
	read_elements_gas_l()
	for btn in buttonsLeft_gas:
		btn.pressed.connect(button_action_left_gas.bind(btn))
		btn.mouse_entered.connect(button_entered_left_gas.bind(btn))
		
func connect_db():
	db.open_db()
	var dict: Dictionary = Dictionary()
	dict["symbol"]="T"
	dict["name"]="test"
	dict["stateid"]=1

func read_elements_solid_r():
	db.open_db()
	db.query("SELECT * FROM main.elements WHERE main.elements.stateid = 1 LIMIT 49999 OFFSET 0;")
	
	var sc_r = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/Matter2/MatterRight/RightBack/SolidLayerR/RightSolidBack/ScrollContainer/VBoxContainer
	for i in range(0, db.query_result.size()):
		
		var button = Button.new()
		
		sc_r.add_child(button)
		button.set_custom_minimum_size(Vector2(295,50))
		button.name = str(db.query_result[i]["id"])
		
		var hboxcon = HBoxContainer.new()
		hboxcon.set_h_size_flags(0)
		hboxcon.set_v_size_flags(0)
		button.add_child(hboxcon)
		buttonsRight_solid.append(button)
		
		var texture = TextureRect.new()
		
		var path = db.query_result[i]["imglink"]
		texture.texture = load(path)
		texture.expand_mode = 3
		texture.stretch_mode = 0
		#texture.stretch_ratio = 1

		hboxcon.size = Vector2(50,50)
		
		hboxcon.add_child(texture)
		
		var lable = Label.new()
		
		lable.text = "    "+str(db.query_result[i]["id"])+" "+str(db.query_result[i]["name"])
		lable.set_stretch_ratio(1)
		hboxcon.add_child(lable)


func read_elements_liquid_r():
	db.open_db()
	db.query("SELECT * FROM main.elements WHERE main.elements.stateid = 2 LIMIT 49999 OFFSET 0;")
	
	var sc_r = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/Matter2/MatterRight/RightBack/LiquidLayerR/RightLiquidBack/ScrollContainer/VBoxContainer
	for i in range(0, db.query_result.size()):
		
		var button = Button.new()
		
		sc_r.add_child(button)
		button.set_custom_minimum_size(Vector2(295,50))
		button.name = str(db.query_result[i]["id"])
		
		var hboxcon = HBoxContainer.new()
		hboxcon.set_h_size_flags(0)
		hboxcon.set_v_size_flags(0)
		button.add_child(hboxcon)
		buttonsRight_liquid.append(button)
		#buttonsLeft_liquid.append(button)
		
		var texture = TextureRect.new()
		
		var path = db.query_result[i]["imglink"]
		texture.texture = load(path)
		texture.expand_mode = 3
		texture.stretch_mode = 0
		#texture.set_stretch_ratio(1)

		hboxcon.size = Vector2(50,50)
		
		hboxcon.add_child(texture)
		
		var lable = Label.new()
		
		lable.text = "    "+str(db.query_result[i]["id"])+" "+str(db.query_result[i]["name"])
		lable.set_stretch_ratio(1)
		hboxcon.add_child(lable)


func read_elements_gas_r():
	db.open_db()
	db.query("SELECT * FROM main.elements WHERE main.elements.stateid = 3 LIMIT 49999 OFFSET 0;")
	
	var sc_r = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/Matter2/MatterRight/RightBack/GasLayerR/RightGasBack/ScrollContainer/VBoxContainer
	for i in range(0, db.query_result.size()):
		
		var button = Button.new()
		
		sc_r.add_child(button)
		button.set_custom_minimum_size(Vector2(295,50))
		button.name = str(db.query_result[i]["id"])
		
		var hboxcon = HBoxContainer.new()
		hboxcon.set_h_size_flags(0)
		hboxcon.set_v_size_flags(0)
		button.add_child(hboxcon)
		buttonsRight_gas.append(button)
		#buttonsLeft_gas.append(button)
		
		var texture = TextureRect.new()
		
		var path = db.query_result[i]["imglink"]
		texture.texture = load(path)
		texture.expand_mode = 3
		texture.stretch_mode = 0
		#texture.set_stretch_ratio(1)

		hboxcon.size = Vector2(50,50)
		
		hboxcon.add_child(texture)
		
		var lable = Label.new()
		
		lable.text = "    "+str(db.query_result[i]["id"])+" "+str(db.query_result[i]["name"])
		lable.set_stretch_ratio(1)
		hboxcon.add_child(lable)



func read_elements_solid_l():
	db.open_db()
	db.query("SELECT * FROM main.elements WHERE main.elements.stateid = 1 LIMIT 49999 OFFSET 0;")
	
	var sc_l = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Left/Matter1/MatterLeft/LeftBack/SolidLayerL/LeftSolidBack/ScrollContainer/VBoxContainer
	for i in range(0, db.query_result.size()):
		
		var button = Button.new()
		
		sc_l.add_child(button)
		button.set_custom_minimum_size(Vector2(295,50))
		button.name = str(db.query_result[i]["id"])
		
		var hboxcon = HBoxContainer.new()
		hboxcon.set_h_size_flags(0)
		hboxcon.set_v_size_flags(0)
		button.add_child(hboxcon)
		buttonsLeft_solid.append(button)
		
		var texture = TextureRect.new()
		
		var path = db.query_result[i]["imglink"]
		texture.texture = load(path)
		texture.expand_mode = 3
		texture.stretch_mode = 0
		#texture.set_stretch_ratio(1)

		hboxcon.size = Vector2(50,50)
		
		hboxcon.add_child(texture)
		
		var lable = Label.new()
		
		lable.text = "    "+str(db.query_result[i]["id"])+" "+str(db.query_result[i]["name"])
		lable.set_stretch_ratio(1)
		hboxcon.add_child(lable)


func read_elements_liquid_l():
	db.open_db()
	db.query("SELECT * FROM main.elements WHERE main.elements.stateid = 2 LIMIT 49999 OFFSET 0;")
	
	var sc_l = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Left/Matter1/MatterLeft/LeftBack/LiquidLayerL/LeftLiquidBack/ScrollContainer/VBoxContainer
	for i in range(0, db.query_result.size()):
		
		var button = Button.new()
		
		sc_l.add_child(button)
		button.set_custom_minimum_size(Vector2(295,50))
		button.name = str(db.query_result[i]["id"])
		
		var hboxcon = HBoxContainer.new()
		hboxcon.set_h_size_flags(0)
		hboxcon.set_v_size_flags(0)
		button.add_child(hboxcon)
		buttonsLeft_liquid.append(button)
		
		var texture = TextureRect.new()
		
		var path = db.query_result[i]["imglink"]
		texture.texture = load(path)
		texture.expand_mode = 3
		texture.stretch_mode = 0
		#texture.set_stretch_ratio(1)

		hboxcon.size = Vector2(50,50)
		
		hboxcon.add_child(texture)
		
		var lable = Label.new()
		
		lable.text = "    "+str(db.query_result[i]["id"])+" "+str(db.query_result[i]["name"])
		lable.set_stretch_ratio(1)
		hboxcon.add_child(lable)


func read_elements_gas_l():
	db.open_db()
	db.query("SELECT * FROM main.elements WHERE main.elements.stateid = 3 LIMIT 49999 OFFSET 0;")
	
	var sc_l = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Left/Matter1/MatterLeft/LeftBack/GasLayerL/LeftGasBack/ScrollContainer/VBoxContainer
	for i in range(0, db.query_result.size()):
		
		var button = Button.new()
		
		sc_l.add_child(button)
		button.set_custom_minimum_size(Vector2(295,50))
		button.name = str(db.query_result[i]["id"])
		
		var hboxcon = HBoxContainer.new()
		hboxcon.set_h_size_flags(0)
		hboxcon.set_v_size_flags(0)
		button.add_child(hboxcon)
		buttonsLeft_gas.append(button)
		
		var texture = TextureRect.new()
		
		var path = db.query_result[i]["imglink"]
		texture.texture = load(path)
		texture.expand_mode = 3
		texture.stretch_mode = 0
		#texture.set_stretch_ratio(1)

		hboxcon.size = Vector2(50,50)
		
		hboxcon.add_child(texture)
		
		var lable = Label.new()
		
		lable.text = "    "+str(db.query_result[i]["id"])+" "+str(db.query_result[i]["name"])
		lable.set_stretch_ratio(1)
		hboxcon.add_child(lable)


func get_sub(x):
	var result = ""
	if(x == 1):
		return result
	else:
		var sub_s = ["₀", "₁", "₂", "₃", "₄", "₅", "₆", "₇", "₈", "₉"]
		for digit in str(x):
			result += sub_s[int(digit)]
		return result

func get_valents(element_data):
	var valents
	if (element_data[0]["valences"] == null):
		valents = 8 - int(element_data[0]["group"])
	elif(int(element_data[0]["valences"]) == 8):
		valents = 4
	elif(int(element_data[0]["valences"]) == 9):
		valents = 3
	else:
		valents = int(element_data[0]["valences"])
	return valents

func get_compound(element1, element2):
	var main_element
	var additional_element
	var main_element_valences
	var additional_element_valences
	if(element1[0]["electronegativity"]<=2):
		main_element = element1
		additional_element = element2
	else:
		main_element = element2
		additional_element = element1
	if(element1[0]["id"] == 1):
		if(element2[0]["electronegativity"]<=2):
			main_element = element2
			additional_element = element1
		elif(element2[0]["group"]<=5):
			main_element = element2
			additional_element = element1
		else:
			main_element = element1
			additional_element = element2
	elif(element2[0]["id"] == 1):
		if(element2[0]["electronegativity"]<=2):
			main_element = element1
			additional_element = element2
		elif(element2[0]["group"]<=5):
			main_element = element1
			additional_element = element2
		else:
			main_element = element2
			additional_element = element1
	if(element1[0]["id"]==17):
		main_element= element2
		additional_element = element1
	elif(element2[0]["id"]==17):
		main_element = element1
		additional_element = element2
	if(element1[0]["id"]==8):
		main_element= element2
		additional_element = element1
	elif(element2[0]["id"]==8):
		main_element = element1
		additional_element = element2
	var temp_main_valences = int(get_valents(main_element))
	var temp_additional_valences = int(get_valents(additional_element))
	var temp = temp_main_valences*temp_additional_valences
	main_element_valences = temp/temp_additional_valences
	additional_element_valences = temp/temp_main_valences
	var str = str(main_element[0]["symbol"])+get_sub(int(additional_element_valences))+str(additional_element[0]["symbol"])+get_sub(int(main_element_valences))
	return str

func import_matter(id):
	db.open_db()
	db.query("SELECT * FROM main.elements WHERE main.elements.id = " + str(id) + ";")
	return db.query_result

func set_type_animation(i):
	match i:
		1:			
			animated_sprite.animation = "gas_gas"
		2:
			animated_sprite.animation = "gas_jidkost"
		3:
			animated_sprite.animation = "jidkost_jidkost"
		4:
			animated_sprite.animation = "jidkost_poroshok"
		5:
			animated_sprite.animation = "gas_jidkost" #Поменять анимацию на твердое+газ


func visible_butoon_mix(matter_one,matter_two):
	if ((matter_one != null) and (matter_two != null)):
		if(matter_one[0]["stateid"] == 3 and matter_two[0]["stateid"] == 3):
		#	number_animation = 1
			GlobalValue.get_num(1)
		if(matter_one[0]["stateid"] == 2 and matter_two[0]["stateid"] == 2):
			#number_animation = 3
			GlobalValue.get_num(3)
		if((matter_one[0]["stateid"] == 3 and matter_two[0]["stateid"] == 2) or (matter_one[0]["stateid"] == 2 and matter_two[0]["stateid"] == 3)):
			#number_animation = 2
			GlobalValue.get_num(2)
		if((matter_one[0]["stateid"] == 1 and matter_two[0]["stateid"] == 2) or (matter_one[0]["stateid"] == 2 and matter_two[0]["stateid"] == 1)):
			#number_animation = 4
			GlobalValue.get_num(4)
		if((matter_one[0]["stateid"] == 1 and matter_two[0]["stateid"] == 3) or (matter_one[0]["stateid"] == 3 and matter_two[0]["stateid"] == 1)):
			#number_animation = 2 #5
			GlobalValue.get_num(2)
		if((int(matter_one[0]["id"] == 2)) or (int(matter_two[0]["id"] == 2)) or (int(matter_one[0]["id"] == 10)) or (int(matter_two[0]["id"] == 10)) or (int(matter_one[0]["id"] == 18)) or (int(matter_two[0]["id"] == 18)) or (int(matter_one[0]["id"] == 36)) or (int(matter_two[0]["id"] == 36)) or (int(matter_one[0]["id"] == 54)) or (int(matter_two[0]["id"] == 54)) or (int(matter_one[0]["id"] == 86)) or (int(matter_two[0]["id"] == 86))):
			GlobalValue.get_num(10)
		if((float(matter_one[0]["electronegativity"]) < 2) and (float(matter_two[0]["electronegativity"]) < 2)):
			GlobalValue.get_num(10)
		if(int(matter_one[0]["id"])==int(matter_two[0]["id"])):
			GlobalValue.get_num(10)
		set_type_animation(GlobalValue.global_num)
		#animated_sprite.visible = true
		mix_button.disabled = false
	

func set_info(i, textureRect, lable):
	db.open_db()
	db.query("SELECT * FROM main.elements WHERE main.elements.id = "+ str(i)+";")
	var path = db.query_result[0]["imglink"]
	textureRect.texture = load(path)
	lable.text = '['+str(db.query_result[0]["symbol"])+'] '+str(db.query_result[0]["name"])
	pass


func _on_matter_2_mouse_entered():
	panel_r.show()
func _on_matter_2_mouse_exited():
	panel_r.hide()
	panel_solid_r.hide()
	panel_liquid_r.hide()
	panel_gas_r.hide()
func _on_matter_1_mouse_entered():
	panel_l.show()
func _on_matter_1_mouse_exited():
	panel_l.hide()
	panel_solid_l.hide()
	panel_liquid_l.hide()
	panel_gas_l.hide()	
	
func _on_right_back_mouse_entered():
	panel_r.show()	
func _on_right_back_mouse_exited():
	panel_r.hide()
	panel_solid_r.hide()
	panel_liquid_r.hide()
	panel_gas_r.hide()	
func _on_left_back_mouse_entered():
	panel_l.show()
func _on_left_back_mouse_exited():
	panel_l.hide()
	panel_solid_l.hide()
	panel_liquid_l.hide()
	panel_gas_l.hide()	
	
func _on_button_solid_r_mouse_entered():
	panel_r.show()
	panel_solid_r.show()
	panel_liquid_r.hide()
	panel_gas_r.hide()
func _on_button_solid_l_mouse_entered():
	panel_l.show()
	panel_solid_l.show()
	panel_liquid_l.hide()
	panel_gas_l.hide()
	
func _on_button_liquid_r_mouse_entered():
	panel_r.show()
	panel_liquid_r.show()
	panel_solid_r.hide()
	panel_gas_r.hide()
func _on_button_liquid_l_mouse_entered():
	panel_l.show()
	panel_liquid_l.show()
	panel_solid_l.hide()
	panel_gas_l.hide()
	
func _on_button_gas_r_mouse_entered():
	panel_r.show()
	panel_gas_r.show()
	panel_solid_r.hide()
	panel_liquid_r.hide()
func _on_button_gas_l_mouse_entered():
	panel_l.show()
	panel_gas_l.show()
	panel_solid_l.hide()
	panel_liquid_l.hide()

	
func _on_right_solid_back_mouse_entered():
	panel_r.show()
	panel_solid_r.show()
func _on_left_solid_back_mouse_entered():
	panel_l.show()
	panel_solid_l.show()

func _on_right_liquid_back_mouse_entered():
	panel_r.show()
	panel_liquid_r.show()
func _on_left_liquid_back_mouse_entered():
	panel_l.show()
	panel_liquid_l.show()

func _on_right_gas_back_mouse_entered():
	panel_r.show()
	panel_gas_r.show()
func _on_left_gas_back_mouse_entered():
	panel_l.show()
	panel_gas_l.show()


func button_action_right_solid(btn:Button) -> void:
	matter2 = import_matter(btn.name)
	set_info(int(matter2[0]["id"]), info_r_testure,info_r_lable)
	info_r.visible = true
	animated_sprite.visible = false
	panel_r.hide()
	panel_solid_r.hide()
	visible_butoon_mix(matter1,matter2)
func button_action_right_liquid(btn:Button) ->void:
	matter2 = import_matter(btn.name)
	set_info(int(matter2[0]["id"]), info_r_testure,info_r_lable)
	info_r.visible = true
	animated_sprite.visible = false
	panel_r.hide()
	panel_liquid_r.hide()
	visible_butoon_mix(matter1,matter2)
func button_action_right_gas(btn:Button) ->void:
	matter2 = import_matter(btn.name)
	set_info(int(matter2[0]["id"]), info_r_testure,info_r_lable)
	info_r.visible = true
	animated_sprite.visible = false
	panel_r.hide()
	panel_gas_r.hide()
	visible_butoon_mix(matter1,matter2)


func button_action_left_solid(btn:Button) -> void:
	matter1 = import_matter(btn.name)
	set_info(int(matter1[0]["id"]), info_l_testure,info_l_lable)
	info_l.visible = true
	animated_sprite.visible = false
	panel_l.hide()
	panel_solid_l.hide()
	visible_butoon_mix(matter1,matter2)
func button_action_left_liquid(btn:Button) ->void:
	matter1 = import_matter(btn.name)
	set_info(int(matter1[0]["id"]), info_l_testure,info_l_lable)
	info_l.visible = true
	animated_sprite.visible = false
	panel_l.hide()
	panel_liquid_l.hide()
	visible_butoon_mix(matter1,matter2)
func button_action_left_gas(btn:Button) ->void:
	matter1 = import_matter(btn.name)
	set_info(int(matter1[0]["id"]), info_l_testure,info_l_lable)
	info_l.visible = true
	animated_sprite.visible = false
	panel_l.hide()
	panel_gas_l.hide()
	visible_butoon_mix(matter1,matter2)

func button_entered_left_solid(btn:Button) ->void:
	panel_l.show()
	panel_solid_l.show()
func button_entered_left_liquid(btn:Button) ->void:
	panel_l.show()
	panel_liquid_l.show()	
func button_entered_left_gas(btn:Button) ->void:
	panel_l.show()
	panel_gas_l.show()
	
func button_entered_right_solid(btn:Button) ->void:
	panel_r.show()
	panel_solid_r.show()
func button_entered_right_liquid(btn:Button) ->void:
	panel_r.show()
	panel_liquid_r.show()	
func button_entered_right_gas(btn:Button) ->void:
	panel_r.show()
	panel_gas_r.show()

func _on_margin_container_2_mouse_entered():
	panel_r.hide()
	panel_gas_r.hide()
	panel_solid_r.hide()
	panel_liquid_r.hide()
	panel_l.hide()
	panel_gas_l.hide()
	panel_solid_l.hide()
	panel_liquid_l.hide()


func _on_button_button_down():
	mix_button.disabled = true
	info_r.visible = false
	info_l.visible = false
	animated_sprite.visible = false
	cont.hide()
	
func _on_animated_sprite_2d_animation_looped():
	cont.show()

func _on_texture_button_button_down():
	if (float(matter1[0]["id"]) == float(matter2[0]["id"])):
		info_compoud_lable.text="Связь между двумя одинаковыми элементами не образуется\n"
	elif ((int(matter1[0]["id"] == 2)) or (int(matter2[0]["id"] == 2)) or (int(matter1[0]["id"] == 10)) or (int(matter2[0]["id"] == 10)) or (int(matter1[0]["id"] == 18)) or (int(matter2[0]["id"] == 18)) or (int(matter1[0]["id"] == 36)) or (int(matter2[0]["id"] == 36)) or (int(matter1[0]["id"] == 54)) or (int(matter2[0]["id"] == 54)) or (int(matter1[0]["id"] == 86)) or (int(matter2[0]["id"] == 86))):
		info_compoud_lable.text="В реакции присутсвует благородный газ, связь не образуется\n"
	elif (((float(matter1[0]["electronegativity"]) >= 2) and (float(matter2[0]["electronegativity"]) >= 2)) or ((float(matter1[0]["electronegativity"]) >= 2) and (float(matter2[0]["electronegativity"]) <= 2)) or ((float(matter1[0]["electronegativity"]) <= 2) and (float(matter2[0]["electronegativity"]) >= 2))):
		info_compoud_lable.text=matter1[0]["symbol"]+" + " + matter2[0]["symbol"] +" образуют связь "+ get_compound(matter1,matter2) +"\n"
	else:
		info_compoud_lable.text="Металл и металл связь не образуют\n"
	
	cont.hide()
