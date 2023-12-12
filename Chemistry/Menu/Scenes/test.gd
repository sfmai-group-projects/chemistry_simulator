
extends Node2D

var db
var db_name="res://database/chemBase.sqlite"
var panel = null

func connect_db():
	db.open_db()
	var dict: Dictionary = Dictionary()
	dict["symbol"]="T"
	dict["name"]="test"
	dict["stateid"]=1
# Called when the node enters the scene tree for the first time.



func createScroll():
	db.open_db()
	db.query("SELECT * FROM main.elements WHERE main.elements.stateid = 1 LIMIT 49999 OFFSET 0;")
	
	var sc = $Background/ColorRect/ScrollContainer/VBoxContainer
	##db.query_with_params("SELECT img FROM main.elements WHERE id = 1")
	#image_data = await(get_node(db.query_with_params("SELECT img FROM main.elements WHERE id = 1")))
	var textB = $Background/TextureRect
	textB.texture = load("res://assets/img/1.png")
	var n = 50
	for i in range(0, db.query_result.size()):
		
		var button = Button.new()
		sc.add_child(button)
		button.set_custom_minimum_size(Vector2(300,50))
		
		var hboxcon = HBoxContainer.new()
		hboxcon.set_h_size_flags(0)
		hboxcon.set_v_size_flags(0)
		button.add_child(hboxcon)
		
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

	
func _ready():
	
	db = SQLite.new()
	db.path=db_name
	createScroll()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
