extends CanvasLayer

const DICCIONARIO = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","ñ","o","p","q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","W","X","Y","Z","á","Á","é","É","í","Í","ó","Ó","ú","Ú","ü","Ü","1","2","3","4","5","6","7","8","9","!",".",",","?","¿","¡","@","%","/"]

func _ready():
	pass



func _on_Boton_Encriptar_pressed():
	if $TextEdit.text == "":
		$AcceptDialog.show()
		pass
	var clave = $TextEdit
	var claveArray = []
	for c in clave:
		claveArray.append(c)
	
