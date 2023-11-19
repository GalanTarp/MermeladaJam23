extends Node

const SPEEDYELLOW = 0.1
const SPEEDRED = 0.11
var tired_eyes = true

func _process(delta):
	$Fondo/raceCarOrange.translate(Vector3(0, 0, SPEEDYELLOW))
	$Fondo/raceCarRed.translate(Vector3(0, 0, SPEEDRED))

	if($Fondo/raceCarOrange.position.z > 10):
		$Fondo/raceCarOrange.translate(Vector3(0, 0, -20))
	if($Fondo/raceCarRed.position.z > 10):
		$Fondo/raceCarRed.translate(Vector3(0, 0, -20))


func _on_timer_timeout():
	if(tired_eyes):
		$SubViewportContainer.stretch_shrink += 1


func _on_button_pressed():
	var tween = get_tree().create_tween()
	tween.tween_property($Blink/ColorRect, "scale", Vector2(1,10), 0.75)
	tween.tween_property($Blink/ColorRect, "scale", Vector2(1,1), 0.25)
	var tween2 = get_tree().create_tween()	
	tween2.tween_property($Blink/ColorRect2, "scale", Vector2(1,-10), 0.75)
	tween2.tween_property($Blink/ColorRect2, "scale", Vector2(1,1), 0.25)
	
	await get_tree().create_timer(1.0).timeout
	tired_eyes = false
	$TimerBlinkEye.start()
	$SubViewportContainer.stretch_shrink = 1


func _on_timer_blink_eye_timeout():
	tired_eyes = true
