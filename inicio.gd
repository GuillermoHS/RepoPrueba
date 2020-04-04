extends CanvasLayer


func _ready():
	pass

# Funcion para cambiar la escena a la de encriptador al presionar el  boton
func _on_Encriptar_pressed():
	get_tree().change_scene("res://Encriptador.tscn")


# Funcion para cambiar la escena a la de desencriptador al presionar el  boton
func _on_Desencriptar_pressed():
	get_tree().change_scene("res://Desencriptador.tscn")
