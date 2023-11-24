extends RigidBody2D
@export var radius = 10
@export var maxAngle = 160
@export var velocity = 500

func _draw():
	draw_circle(Vector2(0,0), radius, "FFC5C5")
	pass

func getStartingDirection():
	var startingAngle = deg_to_rad(randi() % maxAngle - 90)
	return startingAngle
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var center = get_viewport().size / 2
	self.position = center
	self.linear_velocity = Vector2.UP.rotated(getStartingDirection()) * velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Hit sides
	if self.position.x <= 0 + radius:
		self.linear_velocity.x = abs(self.linear_velocity.x)
	if self.position.x >= get_viewport().size.x - radius:
		self.linear_velocity.x = -abs(self.linear_velocity.x)
	if self.position.y <= 0 + radius:
		self.linear_velocity.y = abs(self.linear_velocity.y)
	if self.position.y >= get_viewport().size.y - radius:
		print("GAME OVER")
		self.linear_velocity.y = -abs(self.linear_velocity.y)
	self.linear_velocity = velocity * self.linear_velocity / self.linear_velocity.length()


func onCollide(body):
	if body == $"../Player":
		var hitLocation = position.x - body.position.x
		var newDirection = deg_to_rad(hitLocation / ((body.length + radius) / 2) * (maxAngle - 90))
		self.linear_velocity = Vector2.UP.rotated(newDirection) * velocity
