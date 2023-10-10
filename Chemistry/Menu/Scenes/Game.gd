extends Node


var db
var db_name="res://database/chemBase.sqlite"
# Called when the node enters the scene tree for the first time.
func _ready():
	db = SQLite.new()
	db.path=db_name
	connect_db()
	read_elements()
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
	db.query("SELECT * FROM main.elements LIMIT 49999 OFFSET 0;")
	for i in range(0, db.query_result.size()):
		print(db.query_result[i]["id"], " ",db.query_result[i]["symbol"]," ",db.query_result[i]["name"])
