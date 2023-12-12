extends Node


var db
var db_name="res://database/chemBase.sqlite"

var panel_r = null
var panel_solid_r = null
var panel_liquid_r = null
var panel_gas_r = null
var testLable = null
var buttonsRight_solid = []
var buttonsRight_liquid = []
var buttonsRight_gas = []

var panel_l = null
var panel_solid_l = null
var panel_liquid_l = null
var panel_gas_l = null
var buttonsLeft_solid = []
var buttonsLeft_liquid = []
var buttonsLeft_gas = []

# Called when the node enters the scene tree for the first time.
func _ready():
	db = SQLite.new()
	db.path=db_name
	connect_db()
	
	panel_r = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/Matter2/MatterRight
	panel_solid_r = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/Matter2/MatterRight/RightBack/SolidLayerR
	panel_liquid_r = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/Matter2/MatterRight/RightBack/LiquidLayerR
	panel_gas_r = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/Matter2/MatterRight/RightBack/GasLayerR
	testLable = $PacHomeMolecules2/TestLable
		
	panel_r.visible = false
	panel_solid_r.visible = false
	panel_liquid_r.visible = false
	panel_gas_r.visible = false
	
	panel_l = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Left/Matter1/MatterLeft
	panel_solid_l = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Left/Matter1/MatterLeft/LeftBack/SolidLayerL
	panel_liquid_l = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Left/Matter1/MatterLeft/LeftBack/LiquidLayerL
	panel_gas_l = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Left/Matter1/MatterLeft/LeftBack/GasLayerL
	
	panel_l.visible = false
	panel_solid_l.visible = false
	panel_liquid_l.visible = false
	panel_gas_l.visible = false
	
	read_elements_solid_r()
	for btn in buttonsRight_solid:
		btn.pressed.connect(button_action_right_solid.bind(btn))
	read_elements_liquid_r()
	for btn in buttonsRight_liquid:
		btn.pressed.connect(button_action_right_liquid.bind(btn))
	read_elements_gas_r()
	for btn in buttonsRight_gas:
		btn.pressed.connect(button_action_right_gas.bind(btn))
	


	read_elements_solid_l()
	for btn in buttonsLeft_solid:
		btn.pressed.connect(button_action_left_solid.bind(btn))
	read_elements_liquid_l()
	for btn in buttonsLeft_liquid:
		btn.pressed.connect(button_action_right_liquid.bind(btn))
	read_elements_gas_l()
	for btn in buttonsLeft_gas:
		btn.pressed.connect(button_action_right_gas.bind(btn))
		
		
		
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
		texture.set_expand_mode(3)
		texture.set_stretch_mode(0)
		texture.set_stretch_ratio(1)

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
		texture.set_expand_mode(3)
		texture.set_stretch_mode(0)
		texture.set_stretch_ratio(1)

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
		texture.set_expand_mode(3)
		texture.set_stretch_mode(0)
		texture.set_stretch_ratio(1)

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
		texture.set_expand_mode(3)
		texture.set_stretch_mode(0)
		texture.set_stretch_ratio(1)

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
		texture.set_expand_mode(3)
		texture.set_stretch_mode(0)
		texture.set_stretch_ratio(1)

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
		texture.set_expand_mode(3)
		texture.set_stretch_mode(0)
		texture.set_stretch_ratio(1)

		hboxcon.size = Vector2(50,50)
		
		hboxcon.add_child(texture)
		
		var lable = Label.new()
		
		lable.text = "    "+str(db.query_result[i]["id"])+" "+str(db.query_result[i]["name"])
		lable.set_stretch_ratio(1)
		hboxcon.add_child(lable)



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
func _on_left_back_mouse_entered():
	panel_l.show()
func _on_left_back_mouse_exited():
	panel_l.hide()
	
	
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
	testLable.text += str(btn.name)+"\n"
	panel_r.hide()
	panel_solid_r.hide()
func button_action_right_liquid(btn:Button) ->void:
	testLable.text += str(btn.name)+"\n"
	panel_r.hide()
	panel_liquid_r.hide()
func button_action_right_gas(btn:Button) ->void:
	testLable.text += str(btn.name)+"\n"
	panel_r.hide()
	panel_gas_r.hide()


func button_action_left_solid(btn:Button) -> void:
	testLable.text += str(btn.name)+"\n"
	panel_l.hide()
	panel_solid_l.hide()
func button_action_left_liquid(btn:Button) ->void:
	testLable.text += str(btn.name)+"\n"
	panel_l.hide()
	panel_liquid_l.hide()
func button_action_left_gas(btn:Button) ->void:
	testLable.text += str(btn.name)+"\n"
	panel_l.hide()
	panel_gas_l.hide()
