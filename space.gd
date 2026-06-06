extends Node2D

const STAR_COUNT = 400
const SPREAD_X = 4096  # match your level width
const SPREAD_Y = 2048  # match your level height
var stars = []

func _ready():
	randomize()
	for i in STAR_COUNT:
		var star = {
			"pos": Vector2(randf_range(0, SPREAD_X), randf_range(0, SPREAD_Y)),
			"size": randf_range(1.0, 3.0),
			"brightness": randf_range(0.5, 1.0)
		}
		stars.append(star)
	queue_redraw()

func _draw():
	for star in stars:
		var col = Color(star["brightness"], star["brightness"], star["brightness"])
		draw_circle(star["pos"], star["size"], col)
