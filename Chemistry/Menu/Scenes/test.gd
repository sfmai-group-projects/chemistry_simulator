
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
	db.query("SELECT * FROM main.elements LIMIT 49999 OFFSET 0;")

	var sc = $Background/ColorRect/ScrollContainer/VBoxContainer
	##db.query_with_params("SELECT img FROM main.elements WHERE id = 1")
	#image_data = await(get_node(db.query_with_params("SELECT img FROM main.elements WHERE id = 1")))
	#var textB = $Background/textB
	#textB.set_texture_normal(load("res://assets/img/1.png"))
	for i in range(0, db.query_result.size()):
		var tb = TextureButton.new()
		tb.name = "tb_" +  str(db.query_result[i]["id"])
		var path = db.query_result[i]["imglink"]
		var textureButton = load(path)
		tb.set_texture_normal(textureButton)
	#	tb.set_stretch_mode(0)
		var tf = Label.new()
		tf.text = str(db.query_result[i]["id"])
		sc.add_child(tf)
		

# Set size and position of scrollbar
	#$Background/ScrollContainer/VScrollBar/Container/HScrollBar.rect_min_size = $Background/ScrollContainer/VBoxContainer.rect_max
	#$Background/VBoxContainer/VScrollBar.hide = false
	#$Background/VScrollContainer.v_size_flags = 0
	#$Background/VScrollContainer.connect("scroll_ended", self, "_on_scroll_ended") # Replace with function body.

	
func _ready():
	
	db = SQLite.new()
	db.path=db_name
	createScroll()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
