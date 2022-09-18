extends TextureButton


var has_exec = false
var mouseover = false


func _ready():
	connect("button_down", self, "_on_TextureButtons_down")
	connect("button_up", self, "_on_TextureButtons_up")
	
	
func _on_TextureButtons_down():
	get_parent().Touching = true
	get_parent().readyToAddLine = true


func _on_TextureButtons_up():
	get_parent().Touching = false


func checkHover():
	var mousepos = get_viewport().get_mouse_position()
	if get_global_rect().has_point(mousepos):
		if !has_exec:
			has_exec = true
			mouseover = true
			get_parent().readyToAddLine = true
	else:
		has_exec = false
		mouseover = false
		pass


func _process(delta):
	checkHover()
