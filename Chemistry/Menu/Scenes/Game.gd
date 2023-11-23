extends Node


var db
var db_name="res://database/chemBase.sqlite"
var panel =null

# Called when the node enters the scene tree for the first time.
func _ready():
	db = SQLite.new()
	db.path=db_name
	connect_db()
	read_elements()
	
	panel = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/CanvasLayerMatter2
	panel.visible = false
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func connect_db():
	db.open_db()
	var dict: Dictionary = Dictionary()
	dict["symbol"]="T"
	dict["name"]="test"
	dict["stateid"]=1
	
func read_elements():
	db.open_db()
	"""
	var tableName = "elements"
	"""
	var	vbox = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/CanvasLayerMatter2/ScrollMatter2
	db.query("SELECT * FROM main.elements LIMIT 49999 OFFSET 0;")
	
	var sc = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/CanvasLayerMatter2/VBoxContainer/ScrollContainer
	for i in range(0, db.query_result.size()):
		var tf = TextureRect.new()
		tf.name = "item"+str(db.query_result[i]["id"])
		#tf.text = str(db.query_result[i]["id"])
	#	sc.add_child(tf)

	$PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/CanvasLayerMatter2/VBoxContainer/VScrollBar/Container/HScrollBar.rect_min_size = $PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/CanvasLayerMatter2/VBoxContainer/ScrollContainer.rect_max
	$PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/CanvasLayerMatter2/VBoxContainer/VScrollBar.hide = false
	$PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/CanvasLayerMatter2/VScrollContainer.v_size_flags = 0
	#$PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/CanvasLayerMatter2/VScrollContainer.connect("scroll_ended", self, "_on_scroll_ended")
	
	var first_element =  get_node("PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/CanvasLayerMatter2/ScrollMatter2/VBoxMatter2")
	first_element.position = Vector2(100,100);
	add_child(first_element)
	#for i in range(0, db.query_result.size()):
		
		#var str
		#var item = get_node("PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/CanvasLayerMatter2/ScrollMatter2/VBoxMatter2/item"+str(db.query_result[i]["id"]))
	#	if !item:
		#	var element = get_node("PacHomeMolecules2/MarginContainer2/HBoxContainer/Right/CanvasLayerMatter2/ScrollMatter2/VBoxMatter2").duplicate()
		#	element.name="item"+str(db.query_result[i]["id"])
			#element.rect_size = Button(40,20)
		#	element.position += Vector2(60, 0)
		#	add_child(element)
			#item.text = db.query_result[i]["id"] + " " +db.query_result[i]["symbol"] + " " + db.query_result[i]["name"]
			
			
		#print(db.query_result[i]["id"], " ",db.query_result[i]["symbol"]," ",db.query_result[i]["name"])





func _on_matter_2_mouse_entered():
	panel.show()
	pass # Replace with function body.


func _on_matter_2_mouse_exited():
	panel.hide()
	pass # Replace with function body.



func _on_v_scroll_bar_mouse_entered():
	panel.show()
	pass # Replace with function body.


func _on_v_scroll_bar_mouse_exited():
	panel.hide()
	pass # Replace with function body.
