extends Node2D
#NOTA DEL DESARROLLADOR:
#El código incluye diversas secciones y líneas de código comentadas. 
#Estos corresponden a elementos que fueron desarrollados o probados durante el proceso
#de desarrollo pero no incluidos en la actual versión jugable. 
#En este contexto, se han dejado en el código para su futura implementación o uso.

#variables para estados del juego
var pausado = false
var finalizado = false

#referencias a los sonidos de pausa y finalización
@onready var audioPausa = $audioPausa
@onready var audioFinal = $audioFinal

#pausa:
func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("pausar")):
		var pausaActual = get_tree().paused
		pausado = !pausado
		if pausado: audioPausa.play()
		else:
			audioPausa.stop()
		get_tree().paused = !pausaActual
		
		if finalizado: get_tree().quit()

	if(event.is_action_pressed("aceptar")):
		if pausado:
			get_tree().quit()
		else:
			pass
		
		if finalizado: 
			get_tree().paused = false
			get_tree().reload_current_scene()	
			
#finalizar:			
func _finalizar(_final:bool) -> void:
	audioFinal.play()
	finalizado = !finalizado
	get_tree().paused = _final
	
