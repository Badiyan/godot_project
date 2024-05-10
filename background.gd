extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


var bg_paralax_speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scroll_offset.x -= bg_paralax_speed * delta
	
