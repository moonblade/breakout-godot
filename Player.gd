extends CharacterBody2D
@export var width = 20
@export var length = 300
@export var speed = 20

func _draw():
	draw_line(Vector2(-length/2, 0 ), Vector2(length/2,0), "C7DCA7", width)

func _ready():
	init()

func init():
	var viewPortSize = get_viewport_rect().size
	self.position = Vector2(viewPortSize.x / 2, viewPortSize.y - 50)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_RIGHT):
		self.position.x += speed
	if Input.is_key_pressed(KEY_LEFT):
		self.position.x -= speed
	position.x = clamp(position.x, length/2, get_viewport_rect().size.x - length/2)


var firstHit = true
func _on_ball_body_hit_top():
	if firstHit:
		firstHit = false
		length /= 2
		queue_redraw()
		$"PlayerCollide".init()
