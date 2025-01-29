extends Control

@onready var parent1 = 1
@onready var parent2 = 1
@onready var pet_data = petData.new()
@onready var babyCoatColorList = []

# Baby variables declaration
var babyCoatColor: int
var babyVariant1Color: int
var babyVariant2Color: int
var babyEyesColor: int

var babyCoatVariant: int
var babyCoatVariant1: int
var babyCoatVariant2: int
var babyEyesVariant: int


func _ready() -> void:
	pass
	
func updateProfile(pet_data):
	$pet.update(pet_data)
	print(pet_data.name)

func _on_id_search_2_text_changed(new_text: String) -> void:
	var index = int(new_text)-1
	if(index <= GlobaData.petInventory.size()):
		var data1 = GlobaData.petInventory[index]
		print(data1.name)
		$pet2.update(data1)
		parent2 = data1
	else:
		print("retry")

func _on_id_search_text_changed(new_text: String) -> void:
	var index = int(new_text)-1
	if(index <= GlobaData.petInventory.size()):
		var data = GlobaData.petInventory[index]
		print(data.name)
		$pet.update(data)
		parent1 = data
	else:
		print("retry")

func _on_button_pressed() -> void:
	if parent1 == parent2:
		print("meow")
	else:
		previewUpdate(pet_data)
	
func breedingMath(parent1,parent2):
# Coat Color
	if parent1.ownCoatColor == parent2.ownCoatColor:
		babyCoatColor = parent1.ownCoatColor
	elif parent1.ownCoatColor != parent2.ownCoatColor:
		for i in pet_data.coatColorNumber:
			if(i >= parent1.ownCoatColor and i <= parent2.ownCoatColor):
				babyCoatColorList.append(i)
		
func coatVariant():
	if parent1.ownCoatVariant == parent2.ownCoatVariant:
		babyCoatVariant = parent1.ownCoatVariant
	elif parent1.ownCoatVariant != parent2.ownCoatVariant:
		babyCoatVariant = [parent1.ownCoatVariant,parent2.ownCoatVariant].pick_random()
		var normal = randi_range(1,10)
		var shifting = randi_range(1,30)
		if shifting > normal:
			babyCoatVariant = 0
		elif shifting < normal:
			babyCoatVariant = 1
		else:
			babyCoatVariant = 0
	return babyCoatVariant

func _on_button_2_pressed() -> void:
	breedPet(pet_data)
	
func breedPet(pet_data):
	for i in randi_range(1,4):
			breedingMath(parent1,parent2)
			coatVariant()	
			GlobaData.pet_global_id += 1
			pet_data.id = GlobaData.pet_global_id
			pet_data.name = "Unamed"
			pet_data.ownCoatColor = babyCoatColorList.pick_random()
			pet_data.ownCoatVariant = babyCoatVariant
			pet_data.ownEyesColor = [parent1.ownEyesColor, parent2.ownEyesColor].pick_random()

			GlobaData.petInventory.append(pet_data.clone())
			GlobaData.testPetID[pet_data.id] = pet_data.clone()

			%petInventoryVariant.updateInventory(pet_data)

func previewUpdate(pet_data):
	var preview = []
	var previewSlot = [$preview,$preview2,$preview3,$preview4]
	for i in previewSlot.size():
		breedingMath(parent1,parent2)
		coatVariant()	
		pet_data.name = "Unnamed"
		print(pet_data.name)
		pet_data.ownCoatColor = babyCoatColorList.pick_random()
		pet_data.ownCoatVariant = babyCoatVariant
		pet_data.ownEyesColor = [parent1.ownEyesColor, parent2.ownEyesColor].pick_random()

		preview.append(pet_data.clone())
		previewSlot[i].update(preview[i])
