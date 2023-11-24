extends CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func init(width):
	var rectsize = Vector2(width, get_parent().height)
	var curShape = RectangleShape2D.new()
	curShape.size = rectsize
	set_shape(curShape)
	print(shape.get_rect())
	
func _draw():
#	draw_rect(shape.get_rect(),"ff0000", 10)
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
