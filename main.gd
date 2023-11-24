extends Node2D
@export var blockScene : PackedScene
@export var totalBlocks = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	for top in range(8):
		for left in range(totalBlocks):
			var block = blockScene.instantiate()
			block.init(top,left)
			add_child(block)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
