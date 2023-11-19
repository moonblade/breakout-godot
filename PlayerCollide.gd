extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var rectsize = Vector2(get_parent().length, get_parent().width)
	var curShape = RectangleShape2D.new()
	curShape.size = rectsize
	set_shape(curShape)

func _draw():
#	draw_rect(shape.get_rect(),"ff0000", 10)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
