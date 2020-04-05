extends CanvasLayer

const DICCIONARIO = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","ñ","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","W","X","Y","Z","á","Á","é","É","í","Í","ó","Ó","ú","Ú","ü","Ü","1","2","3","4","5","6","7","8","9","!",".",",","?","¿","¡","@","%","/"]

func _ready():
	pass

# Funcion para volver a la escena de inicio
func _on_Volver_pressed():
	get_tree().change_scene("res://Inicio.tscn")

func _on_Boton_Encriptar_pressed():
	if $TextEdit.text == "":
		$AcceptDialog.dialog_text = "No se ha introducido una clave"
		$AcceptDialog.show()
		pass
	if $textoaencriptar.text == "":
		$AcceptDialog.dialog_text = "No se ha introducido texto para encriptar"
		$AcceptDialog.show()
		pass
	var clave = $TextEdit.text
	var claveArray = []
	var clavePublica: int = 0
	for c in clave:
		claveArray.append(c)
	for c1 in range(0,claveArray.size()):
		for p in range(0,DICCIONARIO.size()):
			if claveArray[c1] == DICCIONARIO[p]:
				clavePublica = clavePublica + p
	var  textoAEncriptar = $textoaencriptar.text
	var  textoArray = []
	for c in textoAEncriptar:
		textoArray.append(c)
	for  c in range(0,textoArray.size()):
		for p in range(0,DICCIONARIO.size()):
			var nuevaPosicion: int = 0
			if textoArray[c] == DICCIONARIO[p]:
				nuevaPosicion = p + clavePublica
				if nuevaPosicion  > DICCIONARIO.size():
					nuevaPosicion = nuevaPosicion - DICCIONARIO.size() - 1
					textoArray[c] = DICCIONARIO[nuevaPosicion]
				else:
					textoArray[c] = DICCIONARIO[nuevaPosicion]
	var textoEncriptado = ""
	for c in range(0,textoArray.size()):
		textoEncriptado += textoArray[c]
	$textoencriptado.text =  textoEncriptado
