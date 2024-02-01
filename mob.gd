extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Gets the list of animation names in AS2D
	# In this example, returns ["walk", "swim", "fly"]
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	# Pick a number 0-2 to select one item
	# randi() % n -> [0,(n-1)]
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
# 	pass
