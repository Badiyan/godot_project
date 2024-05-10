extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var chase = false
var speed = 100
@onready var animation = $AnimatedSprite2D
var alive = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	var player = $"../../Player/player"	
	var direction = (player.position - self.position).normalized()
	
	if alive:
	
		if chase == true:
			if direction.x < 0:
				$AnimatedSprite2D.flip_h = true
			else:
				$AnimatedSprite2D.flip_h = false
			velocity.x = direction.x * speed
			animation.play("run")
		else:
			velocity.x = 0
			animation.play("idle")
		
	move_and_slide()

func _on_detector_body_entered(body):
	if body.name == "player":
		chase = true
	
func _on_detector_body_exited(body):
	if body.name == "player":
		chase = false

func _on_death_body_entered(body):
	if body.name == "player":
		body.velocity.y -= 300
		death()

func _on_death_2_body_entered(body):
	if body.name == "player":
		if alive:
			body.health -= 40
		death()

func death():
	alive = false
	animation.play("death")
	await animation.animation_finished
	queue_free()



