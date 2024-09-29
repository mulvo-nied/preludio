extends CharacterBody2D
#NOTA DEL DESARROLLADOR:
#El código incluye diversas secciones y líneas de código comentadas. 
#Estos corresponden a elementos que fueron desarrollados o probados durante el proceso
#de desarrollo pero no incluidos en la actual versión jugable. 
#En este contexto, se han dejado en el código para su futura implementación o uso.


#/////////////////////ASIGNACIONES GENERALES///////////////////////////
#variables por defecto del código:
const SPEED = 220.0
#const JUMP_VELOCITY = -400.0


#//////////////////////SONIDOS///////////////////////////////////

#volumen general del juego
@onready var volumenMaster = db_to_linear(AudioServer.get_bus_volume_db(0)) 

#Límite
@onready var ruidoBlanco = $"../RuidoBlanco"
@onready var sonidoLimite = $"../sonidoLimite"

#voces
@onready var vozA = $"../vozA"
@onready var vozB = $"../vozB"
@onready var vozD = $"../vozD"

#sección 1:
@onready var audioGolpe1 = $"../SecSonora1/Golpe"
@onready var audioGolpe2 = $"../SecSonora1/Golpe2"
@onready var audioGolpe3 = $"../SecSonora1/Golpe3"
@onready var audioGolpe4 = $"../SecSonora1/Golpe4"
@onready var audioVidrio1 = $"../SecSonora1/Vidrio1"
@onready var audioVidrio1_2 = $"../SecSonora1/Vidrio1_2"

#sección 2:
@onready var audioGota1 = $"../SecSonora2/gota1"
@onready var audioAleatorio1 = $"../SecSonora2/aleatorio1"
@onready var audioAleatorio2 = $"../SecSonora2/aleatorio2"
@onready var audioGota2 = $"../SecSonora2/gota2"
@onready var audioImpL7 = $"../SecSonora2/impL7"
@onready var audioImp2L1 = $"../SecSonora2/imp2L1"
@onready var audioImp2L3 = $"../SecSonora2/imp2L3"
@onready var audioImpL1 = $"../SecSonora2/impL1"
@onready var audioImp2L4 = $"../SecSonora2/imp2L4"
@onready var audioImpL2 = $"../SecSonora2/impL2"
@onready var audioImp2L5 = $"../SecSonora2/imp2L5"
@onready var audioImp2L6 = $"../SecSonora2/imp2L6"
@onready var audioImpL5 = $"../SecSonora2/impL5"
@onready var audioImpL3 = $"../SecSonora2/impL3"
@onready var audioImp2L2 = $"../SecSonora2/imp2L2"
@onready var audioImpA4 = $"../SecSonora2/impA4"
@onready var audioImpA6 = $"../SecSonora2/impA6"
@onready var audioImpA5 = $"../SecSonora2/impA5"
@onready var audioImpA1 = $"../SecSonora2/impA1"
@onready var audioImpA2 = $"../SecSonora2/impA2"
@onready var audioImpA3 = $"../SecSonora2/impA3"
@onready var audioImpA7 = $"../SecSonora2/impA7"
@onready var audioImpA8 = $"../SecSonora2/impA8"
@onready var audioMasaAleatoria1 = $"../SecSonora2/masaAleatoria1"

#sección 3:
@onready var audioSin2L_mod = $"../SecSonora3/sin2L_mod"
@onready var audioImpA3_mod = $"../SecSonora3/impA3_mod"
@onready var audioImp2L4_mod = $"../SecSonora3/imp2L4_mod"
@onready var audioImpA1_mod = $"../SecSonora3/impA1_mod"
@onready var audioGa2Mod_G = $"../SecSonora3/ga2Mod_G"
@onready var audioGa1Mod_A = $"../SecSonora3/ga1Mod_A"


#///////////////////VARIABLES DENTRO DEL JUEGO//////////////////

#variable para el sprite del personaje - para saber en qué dirección va:
@onready var sprite2D = $Sprite2D

#variable para el audiolistener2D - para invertir escucha
@onready var listener = $AudioListener2D

#variable para el audiojuego / admin:
@onready var audiojuego = $"../.."

#variable para voces activables:
#@onready var hablando = 0


#//////////////////////////////FUNCIONES///////////////////////

#función para el movimiento y el salto
func _physics_process(_delta: float) -> void:
	#añade la gravedad
	#if not is_on_floor():
		#velocity += get_gravity() * delta

	#giro:
	#if Input.is_action_just_pressed("voz"): #and is_on_floor():
		##velocity.y = JUMP_VELOCITY
		##listener.scale = listener.scale*-1
		##print("giro")
		##Agregar sonido al giro
		
		#Voces activables mediante inputs:
		#match hablando:
			#0: 
				#await get_tree().create_timer(0.3).timeout
				#vozB.stop()
				#vozD.stop()
				#vozA.play()
			#1:
				#await get_tree().create_timer(0.3).timeout
				#vozA.stop()
				#vozD.stop()
				#vozB.play()
			#2:
				#await get_tree().create_timer(0.3).timeout
				#vozA.stop()
				#vozB.stop()
				#vozD.play()
			#
		#hablando = hablando + 1
		#if hablando >= 3: hablando = 0
			
	#dirección según el input: -1, 0, 1 / izq, 0, der
	var direction := Input.get_axis("avanzarIzquierda", "avanzarDerecha")
	
	#aplica el movimiento:
	if direction:	
		#da vuelta al personaje (sprite):
		if direction < 0: 
			sprite2D.flip_h = false
		elif direction > 0: 
			sprite2D.flip_h = true
		
		#sonidos pasos:
		velocity.x = direction * SPEED
		if $Timer.time_left <=0:
			$Pasos.pitch_scale = randf_range(0.6, 1.2)
			$Pasos.play()
			$Timer.start(0.5)
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

	#para ajustar volumen general
	var volMod := Input.get_axis("bajarVol","subirVol")
	if volMod:
		if volMod < 0: 
			volumenMaster = volumenMaster - 0.01
			if volumenMaster < 0.2:
				volumenMaster = 0.2
		elif volMod > 0:
			volumenMaster = volumenMaster + 0.01
			if volumenMaster > 1:
				volumenMaster = 1
		AudioServer.set_bus_volume_db(0, linear_to_db(volumenMaster))

#activación sonidos:

func _areaRuido(_body: Node2D) -> void:
	ruidoBlanco.play()
	sonidoLimite.play()

func _areaGolpe1(_body: Node2D) -> void:
	audioGolpe1.play()
	
func _areaGolpe2(_body: Node2D) -> void:
	audioGolpe2.play()

func _areaGolpe3(_body: Node2D) -> void:
	audioGolpe3.play()

func _areaGolpe4(_body: Node2D) -> void:
	audioGolpe4.play()

func _areaVidrio1(_body: Node2D) -> void:
	audioVidrio1.play()
	
func _areaVidrio1_2(_body: Node2D) -> void:
	audioVidrio1_2.play()

func _areaGota1(_body: Node2D) -> void:
	audioGota1.play()

func _areaAleatorio1(_body: Node2D) -> void:
	audioAleatorio1.play()

func _areaAleatorio2(_body: Node2D) -> void:
	audioAleatorio2.play()

func _areaGota2(_body: Node2D) -> void:
	audioGota2.play()

func _areaImpL7(_body: Node2D) -> void:
	audioImpL7.play()

func _areaImp2L1(_body: Node2D) -> void:
	audioImp2L1.play()
	
func _areaImp2L3(_body: Node2D) -> void:
	audioImp2L3.play()

func _areaImpL1(_body: Node2D) -> void:
	audioImpL1.play()

func _areaImp2L4(_body: Node2D) -> void:
	audioImp2L4.play()

func _areaImpL2(_body: Node2D) -> void:
	audioImpL2.play()

func _areaImp2L5(_body: Node2D) -> void:
	audioImp2L5.play()

func _areaImp2L6(_body: Node2D) -> void:
	audioImp2L6.play()

func _areaImpL5(_body: Node2D) -> void:
	audioImpL5.play()

func _areaImpL3(_body: Node2D) -> void:
	audioImpL3.play()

func _areaImp2L2(_body: Node2D) -> void:
	audioImp2L2.play()

func _areaImpA4(_body: Node2D) -> void:
	audioImpA4.play()

func _areaImpA6(_body: Node2D) -> void:
	audioImpA6.play()

func _areaImpA5(_body: Node2D) -> void:
	audioImpA5.play()

func _areaImpA1(_body: Node2D) -> void:
	audioImpA1.play()

func _areaImpA2(_body: Node2D) -> void:
	audioImpA2.play()

func _areaImpA3(_body: Node2D) -> void:
	audioImpA3.play()

func _areaImpA7(_body: Node2D) -> void:
	audioImpA7.play()

func _areaImpA8(_body: Node2D) -> void:
	audioImpA8.play()

func _areaMasaAleatoria1(_body: Node2D) -> void:
	audioMasaAleatoria1.play()


func _areaSin2L_mod(_body: Node2D) -> void:
	audioSin2L_mod.play()


func _areaImpA3_mod(_body: Node2D) -> void:
	audioImpA3_mod.play()

func _areaImp2L4_mod(_body: Node2D) -> void:
	audioImp2L4_mod.play()

func _areaImpA1_mod(_body: Node2D) -> void:
	audioImpA1_mod.play()

func _areaGa2Mod_G(_body: Node2D) -> void:
	audioGa2Mod_G.play()

func _areaGa1Mod_A(_body: Node2D) -> void:
	audioGa1Mod_A.play()

func _areaSonidoFinal(_body: Node2D) -> void:
	audiojuego._finalizar(true)
