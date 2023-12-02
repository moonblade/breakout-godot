extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(.90 * get_viewport_rect().size.x, 10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_body_update_score(score):
	self.text = str(score)
