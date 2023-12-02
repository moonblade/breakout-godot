extends RigidBody2D
signal UpdateScore
signal hitTop
@export var radius = 10
@export var maxAngle = 90
@export var velocity = 500
@export var scores = [1,3,5,7]
@export var score = 0

func _draw():
	draw_circle(Vector2(0,0), radius, "FFC5C5")
	pass

func getStartingDirection():
	var startingAngle = deg_to_rad(randi() % maxAngle - maxAngle/2)
	return startingAngle
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var center = get_viewport().size / 2
	self.linear_velocity = Vector2.UP.rotated(getStartingDirection()) * velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.position.x <= 0 + radius:
		self.linear_velocity.x = abs(self.linear_velocity.x)
	if self.position.x >= get_viewport().size.x - radius:
		self.linear_velocity.x = -abs(self.linear_velocity.x)
	if self.position.y <= 0 + radius:
		hitTop.emit()
		self.linear_velocity.y = abs(self.linear_velocity.y)
	if self.position.y >= get_viewport().size.y - radius:
		print("GAME OVER")
		self.linear_velocity.y = -abs(self.linear_velocity.y)
#	self.linear_velocity = velocity * self.linear_velocity / self.linear_velocity.length()

var totalHits = 0
var firstTouch = [2, 3]
func touchLine(line):
	score += scores[line]
	emit_signal("UpdateScore", score)
	totalHits += 1
	if totalHits == 4 or totalHits == 8:
		velocity *= 1.25
	if line in firstTouch:
		firstTouch.erase(line)
		velocity *= 1.25
	

func onCollide(body):
	if body == $"../Player":
		var hitLocation = position.x - body.position.x
		var newDirection = deg_to_rad(hitLocation / ((body.length + radius) / 2) * (maxAngle/2))
		self.linear_velocity = Vector2.UP.rotated(newDirection) * velocity
	else:
		var hitLocation = position - body.position
		touchLine(3-(body.top/2))
		body.queue_free()
		
