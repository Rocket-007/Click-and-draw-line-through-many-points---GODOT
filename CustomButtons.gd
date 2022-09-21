# rocket 007
# https://www.youtube.com/channel/UC8G8IEsYtIkj2hxfnRWhkuQ

extends Node2D


var Touching = false
var readyToAddLine = false
var word_dragged = []

func _ready():
	for v in get_children():
		var label = load("res://label.tscn").instance()
#		btw you are supposed to set the positoin after instancing
		v.add_child(label)
		label.rect_global_position = v.get_global_rect().get_center()
#		label.set_anchor()
#		set_anchor(margin: Margin, anchor: float, keep_margin: bool = false, push_opposite_anchor: b
		label.text = v.letter
#		label.set_z_index(2)
#		print(label.get_z_index())
		
		print(v.get_child(0).text)
		print("txtButtonChildCount   ", v.get_child_count())
		print("button  ", v.rect_position)
		print("letter  ", v.get_child(0).rect_position)
		print("")
		
	pass


func _process(delta):
	readyToAddLine = false
	update()


func _draw():
	for v in get_children():
		draw_circle(v.rect_position, 45.0, Color.yellow)
		draw_circle(v.get_child(0).rect_position, 20.0, Color.blue)
		pass

