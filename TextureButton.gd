# rocket 007
# https://www.youtube.com/channel/UC8G8IEsYtIkj2hxfnRWhkuQ
extends TextureButton

export var letter : String = ""
var has_exec = false
var mouseover = false
var is_selected = false
var is_backtracking = false





func _ready():
	
#	loading in label for the buttons
#	var label = load("res://label.tscn").instance()
#	label.text = letter
##	label.set_position().set_global_position() = get_global_rect().get_global_position()
##	label.rect_global_position = rect_global_position
#	add_child(label)
	
	connect("button_down", self, "_on_TextureButtons_down")
	connect("button_up", self, "_on_TextureButtons_up")
	
	
func _on_TextureButtons_down():
	get_parent().Touching = true
	get_parent().readyToAddLine = true


func _on_TextureButtons_up():
	get_parent().Touching = false
#	this should set all the button is selected to false if we release
	for v in get_parent().get_children():
		v.is_selected = false
		v.is_backtracking = false


func checkHover():
	var mousepos = get_viewport().get_mouse_position()
	if get_global_rect().has_point(mousepos):
#		the first time you hover, this is not executed, its then the second time
		if !has_exec:
			has_exec = true
			mouseover = true
#			check that the button has been selected before
			if is_selected:
#				then say that it is back tracked if it is hovered again
				is_backtracking = true
			else:
				get_parent().readyToAddLine = true
	else:
		has_exec = false
		mouseover = false
		is_backtracking = false
		pass


func _process(delta):
	checkHover()
