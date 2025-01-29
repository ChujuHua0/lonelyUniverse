extends Control

@onready var id = 1
@onready var texture_clicked = preload("res://pet profile ui/petBackToInvClicked.png")

signal backToInv 


func _ready() -> void:
	print("ready")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func updateProfile(pet_data):
	$PetPanel/name.text = pet_data.name
	$PetPanel/baseCoat.text = pet_data.baseFurLabel
	$PetPanel/ID.text = str(pet_data.id)
	$PetPanel/variant1.text = pet_data.variant1Label
	$PetPanel/Eyes.text = pet_data.eyesLabel
	$PetPanel/planetLabel.text = pet_data.planetSign[pet_data.planet]
	id = pet_data.id
	$pet.update(pet_data)

func _on_arrow_profile_left_pressed() -> void:
	id -= 1
	if id < 1:
		id = GlobaData.petInventory.size()
		self.updateProfile(GlobaData.testPetID[id])
	else:
		self.updateProfile(GlobaData.testPetID[id])
	print(id)

func _on_arrow_profile_right_pressed() -> void:
	
	if id > GlobaData.petInventory.size():
		id = 1
		self.updateProfile(GlobaData.testPetID[id])
	else:
		self.updateProfile(GlobaData.testPetID[id])

func _on_rename_pressed() -> void:
	$PetPanel/name.visible = false
	$PetPanel/LineEdit.visible = true

func _on_line_edit_text_submitted(new_text: String) -> void:
	GlobaData.testPetID[id].name = new_text
	self.updateProfile(GlobaData.testPetID[id])
	$PetPanel/name.visible = true
	$PetPanel/LineEdit.visible = false


func _on_pet_inventory_variant_slot_clicked(slot: Variant) -> void:
	self.updateProfile(GlobaData.petInventory[slot])
	self.visible = true
	print("rawr")


func _on_pet_back_to_inv_pressed() -> void:
	$PetBackToInv.icon = texture_clicked
	self.visible = false
	backToInv.emit()
