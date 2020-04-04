extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Funcion para volver a la escena de inicio
func _on_Volver_pressed():
	get_tree().change_scene("res://Inicio.tscn")
