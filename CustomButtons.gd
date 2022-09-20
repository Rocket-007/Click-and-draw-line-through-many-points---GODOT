# rocket 007
# https://www.youtube.com/channel/UC8G8IEsYtIkj2hxfnRWhkuQ

extends Node2D


var Touching = false
var readyToAddLine = false
var word_dragged = []

func _ready():
	pass


func _process(delta):
	readyToAddLine = false
#	this will update the word drag with the letters in the button script
	var i = 0
	for v in get_children():
		if v.is_selected:
			print(v.letter)
#			word_dragged.push_back(v.letter)
			i = i + 1 
