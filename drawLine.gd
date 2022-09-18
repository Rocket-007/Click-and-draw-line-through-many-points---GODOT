# rocket 007
# https://www.youtube.com/channel/UC8G8IEsYtIkj2hxfnRWhkuQ

extends Node2D


func displayOverlayDebugging():
	var overlay = load("res://debug_overlay.tscn").instance()
	overlay.add_stat("Line2d Count ", $Line2D, "get_point_count", true)
	
	overlay.add_stat("ON BUTTONS 1 ", $CustomButtons/TextureButton, "mouseover", false)
	overlay.add_stat("ON BUTTONS 2 ", $CustomButtons/TextureButton2, "mouseover", false)
	overlay.add_stat("ON BUTTONS 3 ", $CustomButtons/TextureButton3, "mouseover", false)
	overlay.add_stat("ON BUTTONS 4 ", $CustomButtons/TextureButton4, "mouseover", false)

	overlay.add_stat("Touching", $CustomButtons, "Touching", false)
	overlay.add_stat("readyToAddLine ", $CustomButtons, "readyToAddLine", false)
	
	add_child(overlay)
	
	
	
func _ready():
	displayOverlayDebugging()
	pass
	
func buttonCenter():
#	fuction to get the hovered over button's center
	for v in $CustomButtons.get_children():
		if v.mouseover:
			return v.get_global_rect().get_center()


func lineFunction():
#	check if we Pressed down on the first button
	if $CustomButtons.Touching == true:
#		check when we are to add new Line2D Point : 
#		ie : hover over any butten including first pressed button
		if $CustomButtons.readyToAddLine == true:
#			is the line point counts 0 |ie: is there no line then
			if $Line2D.get_point_count() == 0:
#				then create line point at last(basically first) position
				$Line2D.add_point(buttonCenter(),-1)
#			add new point at the center of hovered button 
#			(this line point will later be the constantly moving line when we drag) 
			$Line2D.add_point(buttonCenter(),-1)
#			reposition/set the position of 2nd last line point to center of hovered button
			$Line2D.set_point_position($Line2D.get_point_count()-2, buttonCenter())
#		make sure that there are line points in line2D
		if $Line2D.get_point_count() > 0:
#			this will be the last line point that will be following the mouse
			$Line2D.set_point_position($Line2D.get_point_count()-1, get_global_mouse_position())
	else:
#		if you release the mouse, the whole line2D is cleared
		$Line2D.clear_points()


func _process(delta):
	lineFunction()
