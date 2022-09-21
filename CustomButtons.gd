# rocket 007
# https://www.youtube.com/channel/UC8G8IEsYtIkj2hxfnRWhkuQ

extends Node2D


var Touching = false
var readyToAddLine = false
var word_dragged = []

func _ready():
	for v in get_children():
#		creating a new instance parent node for tthe buttons labels
#		because apperently they said that a control node eg: label does not have a zindex
#		and i need that to make the text come on top of the buttons
		var node_container = Node2D.new()
		
		var label_tscn = load("res://label.tscn").instance()
		node_container.add_child(label_tscn)
#		
#		this is to make it so any body in this func looking for the label will use this intead
		var label = node_container.get_child(0)
		
#		btw you are supposed to set the positoin after instancing
		v.add_child(node_container)
		label.rect_global_position = v.get_global_rect().get_center()
		
#		this is to text align enum to 0 = left (because center isnt to good for a char)
		label.align = 0
		
#		these will off set the label so the character appears in the middle of the button center
#		instead of just the top left edge touching em 
		label.margin_left = 16
		label.margin_top = 16
		
		label.text = v.letter
		
#		finally we can set the z index of the node with will in turn affect the label child in it
		node_container.set_z_index(1)


func _process(delta):
	readyToAddLine = false
#	update()
#
#
#func _draw():
#	for v in get_children():
#		draw_circle(v.rect_position, 45.0, Color.yellow)
#		pass

