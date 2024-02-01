extends CanvasLayer

# Notifies Main node that the button has been pressed
signal start_game

func show_message(text):
	# Temporary message
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over!")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	# One.shot timer and wait for it to finish
	await get_tree().create_timer(1.0).timeout
	$ScoreLabel.text = "0"
	$Message.text = "Dodge The Mandem!"
	$Message.show()
	$StartButton.show()
	$HighScoreLabel.show()


func _on_message_timer_timeout():
	$Message.hide()


func _on_start_button_pressed():
	$StartButton.hide()
	$HighScoreLabel.hide()
	start_game.emit()

func update_score(score):
	# Updates score
	$ScoreLabel.text = str(score)

func update_high_score(highscore):
	# Updates highscore
	$HighScoreLabel.text = "Highscore: "+str(highscore)