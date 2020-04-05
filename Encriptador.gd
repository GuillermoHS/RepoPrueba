extends CanvasLayer

const DICCIONARIO = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","ñ","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","W","X","Y","Z","á","Á","é","É","í","Í","ó","Ó","ú","Ú","ü","Ü","1","2","3","4","5","6","7","8","9","!",".",",","?","¿","¡","@","%","/"]

func _ready():
	pass

# Funcion para volver a la escena de inicio
func _on_Volver_pressed():
	get_tree().change_scene("res://Inicio.tscn")

#Funcion para encriptar el texto
func _on_Boton_Encriptar_pressed():
	#Validacion para ver que el cuadro de texto de la clave no esta vacio
	if $TextEdit.text == "":
		$AcceptDialog.dialog_text = "No se ha introducido una clave"
		#Se lanza una ventana de error
		$AcceptDialog.show()
		pass
	#Validacion para ver que el cuadro de texto de el texto a encriptar no esta vacio
	if $textoaencriptar.text == "":
		$AcceptDialog.dialog_text = "No se ha introducido texto para encriptar"
		#Se lanza una ventana de error
		$AcceptDialog.show()
		pass
	#Variable que guarda la clave a usar en String
	var clave = $TextEdit.text
	#Variable que almacenara la clave a usar en Array
	var claveArray = []
	#Variable que almacenara clave en numeros
	var clavePublica: int = 0
	#Bucle que castea la variable String clave en una Array
	for c in clave:
		claveArray.append(c)
	# Bucles aniddados que recorreran toda la clave para sumar todas las posiciones de las letras 
	for c1 in range(0,claveArray.size()):
		for p in range(0,DICCIONARIO.size()):
			if claveArray[c1] == DICCIONARIO[p]:
				clavePublica = clavePublica + p
	#Variable que almacenara el texto a encriptar
	var  textoAEncriptar = $textoaencriptar.text
	#Variable array que almacenara el texto a encriptar casteado a Array
	var  textoArray = []
	for c in textoAEncriptar:
		textoArray.append(c)
	#Bucles aniddados for para encriptar el texto
	#El primero for recorre a array que contiene el texto a encriptar
	for  c in range(0,textoArray.size()):
		#Este segundo for recorre todo el diccionario comparando cada letra de el texto a encriptar con el diccionario
		for p in range(0,DICCIONARIO.size()):
			#Variable que almacenara la neuva posicion que se sumara
			var nuevaPosicion: int = 0
			# validaciones para dar las nuevas posiciones
			if textoArray[c] == DICCIONARIO[p]:
				nuevaPosicion = p + clavePublica
				if nuevaPosicion  > DICCIONARIO.size():
					nuevaPosicion = nuevaPosicion - DICCIONARIO.size() - 1
					textoArray[c] = DICCIONARIO[nuevaPosicion]
				else:
					textoArray[c] = DICCIONARIO[nuevaPosicion]
	var textoEncriptado = ""
	#Bucle que convertira la array de texto en una String 
	for c in range(0,textoArray.size()):
		textoEncriptado += textoArray[c]
	#El cuadro de texto mostrara el texto encriptado
	$textoencriptado.text =  textoEncriptado

# Funcio para resetear los cuadros de texto
func _on_ButtonEN_pressed():
	$textoaencriptar.text = ""
	$textoencriptado.text = ""
	$TextEdit.text = ""
