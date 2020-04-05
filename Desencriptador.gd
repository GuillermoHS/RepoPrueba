extends CanvasLayer

func _on_Boton_Encriptar_pressed():
	if $TexoAdesencriptar.text == "":
		$AcceptDialog.dialog_text = "No se ha introducido texto para desencriptar"
		$AcceptDialog.show()
	if $Clavep.text == "":
		$AcceptDialog.dialog_text = "No se ha introducido una clave"
		$AcceptDialog.show()

# Funcion para volver a la escena de inicio
func _on_Volver_pressed():
	get_tree().change_scene("res://Inicio.tscn")
# Funcion para resetear los textos
func _on_ButtonDES_pressed():
	$TexoAdesencriptar.text = ""
	$TextoDesencriptado.text = ""
	$ClaveP.text = ""

