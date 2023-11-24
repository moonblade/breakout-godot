extends Area2D
var left = 0
var top = 0
var colors = ["FF8080", "FFCF96", "CDFAD5", "F6FDC3"]
var color = ""
var height = 50
var width = 0

func _draw():
	draw_rect(Rect2(Vector2(-width/2,-height/2), Vector2(width, height)), color, true, 1)
	draw_rect(Rect2(Vector2(-width/2,-height/2), Vector2(width, height)), "000000", false, 2)
	pass
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var totalBlocks = get_parent().totalBlocks
	self.width = get_viewport_rect().size.x/totalBlocks
	self.color = colors[floor(top/2)]
	self.position = Vector2((left + 0.5) * (get_viewport_rect().size.x/totalBlocks), (top + 0.5) * height)
	$BlockCollide.init(width)

func init(top=0,left=0):
	self.top = top
	self.left = left

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
