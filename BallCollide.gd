extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var shape = CircleShape2D.new()
	shape.radius = get_parent().radius
	set_shape(shape)

func _draw():
#	draw_circle(Vector2(0,0), get_parent().radius, "00ff00")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
