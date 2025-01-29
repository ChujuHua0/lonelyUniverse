extends Control

@onready var pet = preload("res://petDatabase/Items Scenes/pet.tscn")
@onready var coat = $"pet/coat"
@onready var ears = $"pet/ears"
@onready var eyes = $"pet/eyes"
@onready var sclera = $"pet/sclera"

func update(pet_data) -> void:
	match pet_data.ownCoatVariant:
		0: 
			coat.play("coatDefault")
		1:
			coat.play("shifting")
	match pet_data.ownCoatVariant1:
		0:
			ears.play("earsDefault")
		1:
			ears.play("calico")
	match pet_data.ownEyesVariant:
		0:
			eyes.play("eyesDefault")
		1:
			eyes.play("eyesStarry")
	coat.set_frame(pet_data.ownCoatColor)
	ears.set_frame(pet_data.ownVariant1Color)
	eyes.set_frame(pet_data.ownEyesColor)
	sclera.set_frame(pet_data.ownEyesColor)
